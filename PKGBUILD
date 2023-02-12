# Maintainer: budRich von budlabs
# Contributor: budRich

pkgname=pkg-listn
pkgver=0.2.0
pkgrel=1
pkgdesc='Manage linux packages with a textfile'
arch=('any')
url='https://github.com/budRich/pkg-listn'
# url='file:///home/bud/git/bud/pkg-listn'
license=('Unlicense')
depends=('bash>=4.0.0' 'sed')
makedepends=(m4)
optdepends=('yay: AUR helper' 'paru: AUR helper')
conflicts=()
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
provides=()
sha256sums=('SKIP')

package() {
  cd "${pkgname}-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
