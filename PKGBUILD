# Maintainer: libele <libele@disroot.org>

pkgname=vilearn
pkgver=1.2
pkgrel=1
pkgdesc="An interactive vi tutorial"
arch=('any')
url="https://git.sr.ht/~libele/vilearn"
license=('custom:Copyright')
makedepends=('bmake')
optdepends=('vi: the original ex/vi text editor')
source=("https://git.sr.ht/~libele/vilearn/refs/download/$pkgver/vilearn-$pkgver.tar.gz")
sha256sums=('56c0df5627fdf66b4fd26056f49443aed9d9e27ea271f86298cb21e039409e96')

package() {
  cd "$pkgname-$pkgver"

  bmake DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 README.md "$pkgdir"/usr/share/vilearn/README
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/vilearn/LICENSE
}
