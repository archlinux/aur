# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=python-pypemicro
_pkgname=${pkgname#python-}
pkgver=0.1.7
pkgrel=1
pkgdesc="Python interface for PEMicro debug probes precompiled libraries"
arch=('any')
url="https://github.com/nxpmicro/pypemicro"
license=('BSD-3-Cause')
makedepends=('python-setuptools')
depends=('python')
source=(https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha512sums=('0e878734c0cb95c88d0ac6ee7f266c64c74475981fb9deffcc0b19cbbcc5170e4fb5fa6ab59a5822d0e32be2d5e4f30a3ab126137ecc1193867e51253692c0b6')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
