# Maintainer: Letu Ren <fantasquex@gmail.com>

pkgname=python-etuples
_pkgname=etuples
pkgver=0.3.5
pkgrel=2
pkgdesc="Python S-expression emulation using tuple-like objects."
arch=('any')
url="https://github.com/pythological/etuples/"
license=('APACHE')
depends=(
    'python-cons'
    'python-multipledispatch'
)
makedepends=(
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c54845145507c879f37f7c4ad9fe269711503653f2b75ec2266c8c4b75255989')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

