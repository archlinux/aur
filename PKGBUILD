# Maintainer: Zack Didcott

pkgname=bms-token-git
pkgver=2.0.1
pkgrel=1
pkgdesc="BMS/Secure-IT Token OATHController."
arch=("any")
url="https://github.com/Zedeldi/BMS-Token"
license=("GPL3")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel")
source=("$pkgname::git+https://github.com/Zedeldi/BMS-Token.git")
b2sums=("SKIP")

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
