# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=droidbattles-git
pkgver=r147.8e47dfe
pkgrel=1
pkgdesc='A programming game where you program bots in assembly'
arch=('i686' 'x86_64')
url='https://github.com/sandsmark/droidbattles'
license=('LGPL')
depends=('qt5-base')
makedepends=('qt5-base')
conflicts=(droidbattles)
provides=(droidbattles)
source=('git://github.com/sandsmark/droidbattles.git')
md5sums=('SKIP')

pkgver() {
  cd droidbattles
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd droidbattles
  qmake
  make
}

package() {
  cd droidbattles
  make INSTALL_ROOT="$pkgdir" install
    install -vDm 644 {AUTHORS,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"

}
