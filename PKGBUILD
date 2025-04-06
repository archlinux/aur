# Maintainer: Phyo Wai Lin (nureon22) <phyowailin2004@proton.me>

pkgname=genpwd
pkgver=1.3.0
pkgrel=1
pkgdesc="Simple password generator CLI app"
url="https://github.com/nureon22/genpwd"
arch=("any")
license=("MIT")
depends=("python")
makedepends=("python-build" "python-installer" "python-setuptools")
source=("$pkgname-$pkgver.tar.gz::https://github.com/nureon22/genpwd/archive/refs/tags/1.3.0.tar.gz")
sha256sums=("ab3833443b29e966a3dfa8b9a7e2ccc0952a419bd4590f6f0d0f9ca9070d8921")

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir "$pkgdir" "dist/$pkgname-$pkgver-py3-none-any.whl"
}


