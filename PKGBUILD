# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-emcee
pkgver=2.2.1
pkgrel=1
pkgdesc="Kick ass affine-invariant ensemble MCMC sampling"
arch=('any')
url="http://emcee.readthedocs.io/en/stable/"
license=('MIT')
depends=('python2' 'python2-numpy')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/e/emcee/emcee-${pkgver}.tar.gz")
md5sums=('cd3f7a6ff6a8124fed86afeea69b9cac')

build () {
    cd ${srcdir}/emcee-${pkgver}

    python2 setup.py build
}

check(){
    cd ${srcdir}/emcee-${pkgver}

    python2 setup.py test
}

package() {
    cd ${srcdir}/emcee-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
