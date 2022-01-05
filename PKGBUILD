# Maintainer: Maciej Dems <macdems@gmail.com>
pkgbase='python-sphinxcontrib-napoleon'
pkgname=('python-sphinxcontrib-napoleon' 'python2-sphinxcontrib-napoleon')
_module='sphinxcontrib-napoleon'
pkgver=0.7
pkgrel=3
pkgdesc='Sphinx "napoleon" extension.'
url="https://sphinxcontrib-napoleon.readthedocs.io"
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz" "python310.patch")
sha256sums=('407382beed396e9f2d7f3043fad6afda95719204a1e1a231ac865f40abcbfcf8'
            'dd51ef321c6a19c774c9c3683847e30991a2fb9d69e12ca7b223e4a188022923')
makedepends=('python-setuptools' 'python2-setuptools')

prepare() {
    cd "${srcdir}/${_module}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/python310.patch"
}

package_python-sphinxcontrib-napoleon() {
    depends=('python' 'python-pockets')
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-sphinxcontrib-napoleon() {
    depends=('python2' 'python2-pockets')
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
