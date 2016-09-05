# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>

pkgname=c-lolcat
pkgver=r25.88c27c9
pkgrel=1
pkgdesc="High-performance implementation of lolcat"
arch=('i686' 'x86_64')
url="https://github.com/jaseg/lolcat"
license=('WTFPL')
depends=()
makedepends=()
conflicts=('lolcat' 'python-lolcat')
source=("$pkgname"::'git+https://github.com/jaseg/lolcat.git')
sha256sums=(SKIP)

pkgver() {
    cd "$srcdir/$pkgname"
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git describe --always)"
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "${pkgdir}/usr/local/bin"
  make install # DESTDIR="$pkgdir/" install
}
