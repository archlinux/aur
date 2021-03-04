# Maintainer: Caspar Friedrich <c.s.w.friedrich@gmail.com>

pkgname='python-imgtool'
_name="imgtool"
pkgdesc="MCUboot's image signing and key management"
pkgver=1.7.1
pkgrel=1
arch=('any')
url='https://pypi.org/project/${_name}/'
license=('Apache')
depends=('python>=3.6')
#makedepends=()
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

build() {
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py build
}

package() {
    cd ${srcdir}/${_name}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('88c94036417653703bf6c7071d07316adf8386fcb517fafe672fd487217aabdd')
