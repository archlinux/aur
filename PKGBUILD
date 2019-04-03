# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgname=python2-healpy
pkgver=1.12.9
pkgrel=2
pkgdesc="Python package to manipulate healpix maps"
arch=('i686' 'x86_64')
url="http://healpy.readthedocs.io"
license=('GPL')
depends=('python2>=2.7' 'python2-numpy>=1.5' 'python2-matplotlib' 'python2-astropy' 'cfitsio' 'healpix')
makedepends=('cython2>=0.16')
optdepends=('python-healpy-doc: Documentation for healpy')
source=("https://files.pythonhosted.org/packages/source/h/healpy/healpy-${pkgver}.tar.gz")
md5sums=('9c1a5ae49b95b6fdbaf352ac8182b9b8')

package() {
    cd ${srcdir}/healpy-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    mv ${pkgdir}/usr/bin/healpy_get_wmap_maps{,2}.sh
}
