# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgbase=('python-exifread')
pkgname=('python2-exifread' 'python-exifread')
_module='ExifRead'
pkgver='2.1.2'
pkgrel=2
pkgdesc="Read Exif metadata from tiff and jpeg files."
url="https://github.com/ianare/exif-py"
depends=('python')
makedepends=('python2-pip' 'python-pip')
license=('BSD')
arch=('any')
source=("https://pypi.python.org/packages/source/E/ExifRead/ExifRead-${pkgver}.tar.gz")
md5sums=('8f5099e11e2137e0ce5acbec91c219be')

package_python2-exifread() {
    cd "${srcdir}/${_module}-${pkgver}"
    echo :: Installing for python2.7 ...
    pip2 install --isolated --prefix=/usr --root="${pkgdir}" --no-deps --ignore-installed .
    
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE.txt"
}

package_python-exifread() {
    cd "${srcdir}/${_module}-${pkgver}"
    echo :: Installing for python3 up to python3.4 ...
    pip3 install --isolated --prefix=/usr --root="${pkgdir}" --no-deps --ignore-installed .
}
