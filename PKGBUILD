# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Arthur Danskin <arthurdanskin@gmail.com>
# Contributor:  Mike Ressler <mike.ressler@alum.mit.edu>

pkgname=python-pyfits
pkgver=3.5
pkgrel=1
pkgdesc="A python language interface to FITS formatted data files"
url="http://www.stsci.edu/resources/software_hardware/pyfits"
license=('BSD')
arch=('i686' 'x86_64')
source=("https://files.pythonhosted.org/packages/source/p/pyfits/pyfits-${pkgver}.tar.gz")
md5sums=('68b6c072ff6883fe91cde29030f8b6e8')

depends=('python>=3.3' 'python-numpy')

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

