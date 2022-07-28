# Maintainer: Max Gautier <mg@max.gautier.name>
pkgname=all-repos
pkgver=1.23.0
pkgrel=1
pkgdesc="Clone all your repositories and apply sweeping changes"
arch=(any)
url="https://github.com/asottile/all-repos"
license=('MIT')
depends=(python python-identify)
makedepends=(python-setuptools)
optdepends=()
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('5ecba787dfbacd45632cfcba53ab01a1d81a52633ceb7555a0f81d1325fdcc70')

build() {
    cd "${pkgname//-/_}-$pkgver"
    python setup.py build
}

package() {
    cd "${pkgname//-/_}-$pkgver"
    python setup.py --root="$pkgdir" --optimize=1
    install -Dm 644 "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
