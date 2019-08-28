# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.imagestats
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.6.2
pkgrel=1
pkgdesc="STScI clipped image statistics with core functionality of IRAF's imstatistics"
arch=('i686' 'x86_64')
url="https://stsciimagestats.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python-numpy' 'python-relic')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        'https://raw.githubusercontent.com/spacetelescope/stsci.imagestats/master/LICENSE.txt')
md5sums=('54fde240cb959755efee0b9f0c8e9450'
         'ca8dea23b938590a38eb415a5e448511')

package_python-stsci.imagestats() {
    depends=('python>=3.5' 'python-numpy>=1.13')
    optdepends=('python-stsci.imagestats-doc: Documentation for STScI Imagestats')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
