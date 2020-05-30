# Maintainer: acxz <akashpatel2008@yahoo.com>

pkgname="python-flake8-builtins"
_pkgname="flake8-builtins"
pkgver=1.5.3
pkgrel=1
pkgdesc="Check for python builtins being used as variables or parameters."
arch=('any')
url="https://github.com/gforcada/${_pkgname}"
license=('GPL-2.0')
depends=('flake8')
source=("https://github.com/gforcada/flake8-builtins/archive/$pkgver.tar.gz")
md5sums=('37b4f9d07afde9a46fd1aa9fb19c3714')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
