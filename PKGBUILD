# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>
pkgname=('python-pycifrw')
_pkgname='PyCifRW'
pkgver=4.4
pkgrel=2
pkgdesc="CIF/STAR file support for Python"
url="https://bitbucket.org/jamesrhester/pycifrw"
arch=("any")
license=('Python-2.0')
makedepends=('python-setuptools')
depends=('python-numpy')
source=("https://bitbucket.org/jamesrhester/pycifrw/downloads/$_pkgname-$pkgver.tar.gz")
md5sums=('33b14211e6b01a3218bda51461d2760f')

prepare() {
    cp -a "${srcdir}/$_pkgname-$pkgver"{,-py2}
}

package() {
    cd "$srcdir/${_pkgname}-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
