# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Arthur Danskin <arthurdanskin@gmail.com>
# Contributor:  Mike Ressler <mike.ressler@alum.mit.edu>

pkgname=python-pyfits
pkgver=3.4
pkgrel=2
pkgdesc="A python language interface to FITS formatted data files"
url="http://www.stsci.edu/resources/software_hardware/pyfits"
license=('BSD')
arch=('i686' 'x86_64')
source=("https://files.pythonhosted.org/packages/source/p/pyfits/pyfits-${pkgver}.tar.gz")
md5sums=('ae38c61ed5574f29cfd202bfe3091fd9')

depends=('python>=3.1' 'python-numpy')

build() {
    cd "${srcdir}/pyfits-${pkgver}"
    python setup.py build 
}

package() {
    cd "${srcdir}/pyfits-${pkgver}"
    python setup.py install --prefix=/usr --root="${pkgdir}"
    install -m755 -d "${pkgdir}/usr/share/licenses/python-pyfits"
    install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-pyfits/"
}

