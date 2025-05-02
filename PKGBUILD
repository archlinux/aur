# Maintainer: kochan <bifadea02 at disroot dot org>

pkgname=xmas
pkgver=2022.1
pkgrel=1
pkgdesc="A cat, sitting on a wall, near a Xmas tree, is gazing starry picturesque night"
arch=('any')
url="https://github.com/nasyxx/xmas.py"
license=("GPL-3.0-only")
depends=('python>=3.8')
source=(
  "https://files.pythonhosted.org/packages/d3/2a/31ccf7290e08757433da0492c6a214d2a4ff3059378b0366055db3265c0a/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  '1ab9b916339c01c3ca9712c28584b5c222df5acb70366477b6c0821a46c35b0f'
)

package() {
    cd "$srcdir/$pkgname-$pkgver"

    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "xmas.py" "$pkgdir/usr/bin"

    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname"
    # NOTE: LICENSE file is not presented in the package archive, but it's GPL-3.0, according to its metadata.
}
