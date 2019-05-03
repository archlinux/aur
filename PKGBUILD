# Maintainer: hexchain

pkgname=meson-cmake-wrapper
pkgdesc="Build system wrapper that provides Meson integration in CMake IDE's"
pkgver=0.3.4
pkgrel=1
license=(MIT)
url="https://github.com/prozum/meson-cmake-wrapper"
arch=("any")
depends=("python")
source=(
    "https://files.pythonhosted.org/packages/source/m/$pkgname/$pkgname-$pkgver.tar.gz"
    "LICENSE.$pkgname::https://github.com/prozum/meson-cmake-wrapper/raw/fa45d580fde94eed838a069c6296b1bbe5b0164a/LICENSE")
sha256sums=("c4bfb811975debdcf22b4c16a3f812b37d7b7b91a05444d937e46b9f305f0131" "SKIP")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1

    cd "$srcdir"
    install -Dm644 LICENSE.$pkgname "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
