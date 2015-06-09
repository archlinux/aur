# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

pkgname=hss-git
pkgver=r46.5af3d56
pkgrel=1
pkgdesc="A tool that extends the CSS syntax with powerful features such as variables and nested blocks"
arch=(i686 x86_64)
url="http://ncannasse.fr/projects/hss"
license=('GPL')
depends=('neko>=1.8.2')
makedepends=(git 'neko>=1.8.2')
options=(!strip)
source=('hss::git+https://github.com/ncannasse/hss.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname/-git/}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
  cd "$srcdir/${pkgname/-git/}"
  make
}

package() {
  install -D -T "$srcdir/${pkgname/-git/}"/bin/hss "$pkgdir"/usr/bin/hss
}

# vim:set ts=2 sw=2 et:
