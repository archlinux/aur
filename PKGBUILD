# Maintainer: Adralioh <aur at adralioh dot dev>
pkgname=ytcl
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI frontend for ytdl-server"
arch=('any')
url="https://gitlab.com/adralioh/ytcl"
license=('MIT')
depends=('python>=3.7')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('5af1f8dd5c3bcd2001c08dd778da279a4f68f1ec02ceb530f87e0a1da7061c9a')

build() {
  cd "$pkgname-$pkgver"
  python -c 'from setuptools import setup; setup()' build
}

package() {
  cd "$pkgname-$pkgver"
  python -c 'from setuptools import setup; setup()' install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
