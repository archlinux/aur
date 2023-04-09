# Maintainer: budRich von budlabs
# Contributor: budRich

pkgname=pkg-listn
pkgver=0.2.2
pkgrel=1
pkgdesc='Manage linux packages with a textfile'
arch=('any')
url='https://github.com/budRich/pkg-listn'
# url='file:///home/bud/git/bud/pkg-listn'
license=('Unlicense')
depends=('bash>=4.0.0' 'sed')
makedepends=(m4 gawk)
optdepends=('yay: AUR helper' 'paru: AUR helper')
conflicts=()
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
provides=()
sha256sums=('8a6898ae22e09d416495aa55dda637a6ccd59feae33a3ac5903beb929d518359')

package() {
  cd "${pkgname}-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
