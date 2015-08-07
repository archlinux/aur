# Maintainer: 2ion <dev@2ion.de>
pkgname=cpdf-bin
pkgver=2.1
pkgrel=2
pkgdesc="PDF Command Line Tools allow you to manipulate existing PDF files in a variety of ways"
arch=('x86_64' 'i686')
url="http://community.coherentpdf.com"
license=('custom:eula')
depends=('glibc')
makedepends=('coreutils' 'binutils') # install, strip
provides=('cpdf')
conflicts=('cpdf-git')
replaces=('cpdf-git')
source=('https://github.com/coherentgraphics/cpdf-binaries/raw/master/LICENSE' \
  'https://github.com/coherentgraphics/cpdf-binaries/raw/master/cpdfmanual.pdf')
source_x86_64=('https://github.com/coherentgraphics/cpdf-binaries/raw/master/Linux-Intel-64bit/cpdf')
source_i686=('https://github.com/coherentgraphics/cpdf-binaries/raw/master/Linux-Intel-32bit/cpdf')
md5sums=('8d549251f5c121ac09b33161a6254c2a' \
  '743f6b251750c7a9aa36953dfcfbeca8')
md5sums_x86_64=('85b261bb16809a0ecaa6be8120259778')
md5sums_i686=('68c80e2a22dcb70a4f84f6dc917a4fdf')
noextract=('cpdf')

prepare() {
  cd "$srcdir"
  strip cpdf
}

package() {
  cd "$srcdir"
  install -Dm755 cpdf "${pkgdir}/usr/bin/cpdf"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  install -Dm644 cpdfmanual.pdf "${pkgdir}/usr/share/doc/${pkgname%-bin}/manual.pdf"
}
