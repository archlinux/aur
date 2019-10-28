# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-emcee
pkgver=3.0.1
pkgrel=1
pkgdesc="Kick ass affine-invariant ensemble MCMC sampling"
arch=('any')
url="http://emcee.readthedocs.io/"
license=('MIT')
depends=('python2-numpy')
optdepends=('python2-tqdm: For progress bars'
            'python2-h5py: For HDF5 backend')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest' 'python2-scipy' 'python2-h5py')
source=("https://files.pythonhosted.org/packages/source/e/emcee/emcee-${pkgver}.tar.gz")
md5sums=('5dcedeec26010549af341863966dd4c7')

build () {
    cd ${srcdir}/emcee-${pkgver}

    python2 setup.py build
}

check(){
    cd ${srcdir}/emcee-${pkgver}

    pytest2
}

package() {
    cd ${srcdir}/emcee-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
