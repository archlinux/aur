# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Stunts <f.pinamartins@gmail.com>
# Contributor: LoneWolf <lonewolf@xs4all.nl>
pkgname=staden
pkgver=2.0.0b11
_pkgname=$pkgname-$pkgver-2016-src
pkgrel=2
pkgdesc="Tools for DNA sequence assembly (Gap4/5), editing and analysis (Spin)"
arch=('i686' 'x86_64')
url="http://staden.sourceforge.net/"
license=('BSD')
depends=('staden-io_lib' 'tklib>=0.7' 'tklib<0.8')
optdepends=('iwidgets: gap5 prefinish'
            'xz: better gap5 compression'
            'libpng: gap5 Report Mutations')
source=(http://downloads.sourceforge.net/staden/$_pkgname.tar.gz)
options=('!emptydirs')
sha256sums=('cd7ee17626c25bc845ebd3f6311b5a538815fb73a0dfef2393001bf579ac9649')

build() {
  cd $_pkgname
  ./configure --prefix=/usr --with-tklib=/usr/lib/tklib0.7
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
