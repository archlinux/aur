# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

pkgname=python-retry
_name=retry
_pyver=3.9
pkgver=0.9.2
pkgrel=2
pkgdesc="Easy to use retry decorator."
url="https://github.com/invl/retry"
depends=('python')
makedepends=('python-setuptools')
license=('Apache')
arch=('any')
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
md5sums=('81089364adc2d9a271f1b71eb9ef312b')

build() {
    cd $srcdir/retry-${pkgver}
    python setup.py build
}

package() {
    cd $srcdir/retry-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 
    chmod 644 ${pkgdir}/usr/lib/python${_pyver}/site-packages/${_name}-${pkgver}-py${_pyver}.egg-info/*
}
