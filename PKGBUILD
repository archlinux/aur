# Maintainer: Corentin Cadiou <contact@cphyc.me>
pkgname=python-qobuz
_module_name=qobuz
pkgver=0.0.2
pkgrel=1
pkgdesc="Unofficial python library for the Qobuz-API."
arch=(any)
url="https://github.com/taschenb/mopidy-qobuz"
license=('Apache2')
depends=(python-requests)
makedepends=(python-setuptools)
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module_name::1}/$_module_name/$_module_name-$pkgver.tar.gz")
sha256sums=('0914ed019396e124927cafc09588e5e770d4bafc9b5fec43fc4b31d12c353fb9')

makedepends=('python-setuptools')  # unless it only requires distutils

build() {
    cd "$srcdir/${_module_name}-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/${_module_name}-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
