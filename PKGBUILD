# Maintainer: Benjamin Winger <bmw@disroot.org>

pkgname=python-mailbits
pkgver=0.2.2
pkgrel=1
pkgdesc="Assorted e-mail utility functions"
provides=('python-mailbits')
conflicts=('python-mailbits')
arch=(any)
url="https://github.com/jwodder/mailbits"
license=(MIT)
depends=("python"
    "python-attrs")
makedepends=("python-setuptools" "python-build" "python-installer" "python-hatchling")
source=("https://github.com/jwodder/mailbits/archive/refs/tags/v$pkgver.zip")
sha512sums=('afd1e5ea00f9267cbd55a3575df345b909efeadbd8aed556166a6190346c75fa5932d0b79f14b8613b572e92528a354019cb29e360f779b52d1e2a13f3656a00')

build() {
  cd "$srcdir/mailbits-$pkgver"
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd "$srcdir/mailbits-$pkgver"
  python -m installer --destdir $pkgdir dist/*.whl
}
