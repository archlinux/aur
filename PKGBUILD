# Maintainer: XavierCLL

pkgbase=python-rios
pkgname=('python-rios' 'python2-rios')
pkgver=1.4.3
pkgrel=1
pkgdesc="A set of Python modules which makes it easy to write raster processing code in Python. Built on top of GDAL."
arch=('any')
url="http://rioshome.org/"
license=('GPLv3')
source=("https://bitbucket.org/chchrsc/rios/downloads/rios-$pkgver.tar.gz")
sha256sums=('2dfb4c4712e5182b49e92709d48a0ff79c89a8f1e2199aed9523de6c201600d8')

build() {
    cp -a ${srcdir}/rios-$pkgver ${srcdir}/rios-$pkgver-2

    cd ${srcdir}/rios-$pkgver/
    python setup.py build
    
    cd ${srcdir}/rios-$pkgver-2/
    python2 setup.py build
}

package_python-rios() {
    depends=('python' 'python-numpy' 'gdal')
    cd ${srcdir}/rios-$pkgver/
    python setup.py install --root="$pkgdir"
}

package_python2-rios() {
    depends=('python2' 'python2-numpy' 'gdal')
    cd ${srcdir}/rios-$pkgver-2/
    python2 setup.py install --root="$pkgdir"
}
