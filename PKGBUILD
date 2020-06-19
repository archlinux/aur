# Maintainer: Lucki <https://aur.archlinux.org/account/Lucki>
# shellcheck disable=SC2034,2154,2148

pkgname=python-genzshcomp
_pkgname=${pkgname#python-}
pkgver=0.6.0
pkgrel=1
source=("$pkgname-$pkgver.src.tar.gz::https://github.com/hhatto/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('21997c8e0e5de263a797dc195b2aa8fbdd8adc64a8c474260e654de1e03cbfa8c53bb6d58e5eefb40f58903ae1fa939f89398c243f20428504f273a150db2e66')
pkgdesc="Automatic generate to Zsh Completion Function from Python's Option Parser Modules."
arch=('any')
url="https://github.com/hhatto/genzshcomp"
license=('BSD3')
depends=('python')
makedepends=('python-setuptools')

build() {
    cd "$_pkgname-$pkgver" || exit
    python setup.py build
}

package() {
    cd "$_pkgname-$pkgver" || exit
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
