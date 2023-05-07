# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=pyocd-pemicro
pkgname=python-$_pkgname
pkgver=1.1.5
pkgrel=1
pkgdesc="Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP"
url="https://github.com/pyocd/pyocd-pemicro"
depends=('python'
         'python-pypemicro'
         'python-pyocd'
         )
license=('BSD-3-Clause')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel'
            )
arch=('any')
source=("https://pypi.python.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('7be52c7b214a89378f37fbd1c66e0b5a153e7ecd16959214790e37b1c5a976535395a3805aa3574e20cec33742ea559a744cc394403be20a42ee7aa1c7373968')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

