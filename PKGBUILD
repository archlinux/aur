# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-mailbits
pkgver=0.2.1
pkgrel=1
pkgdesc="Assorted e-mail utility functions"
provides=('python-mailbits')
conflicts=('python-mailbits')
arch=(any)
url="https://github.com/jwodder/mailbits"
license=(MIT)
depends=("python"
    "python-attrs")
makedepends=("python-setuptools" "python-build" "python-install")
source=("https://github.com/jwodder/mailbits/archive/refs/tags/v$pkgver.zip")
sha512sums=('be8a408be959ead1a06542ef0568fa286ec66c6e4b94fbe88ecac9881812cf7af3b191b7e1e06733f28c814914e60b3b82b41570805a082d2abf9d1399653a1a')

build() {
  cd "$srcdir/mailbits-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/mailbits-$pkgver"
  python -m install --destdir $pkgdir dist/*.whl
}
