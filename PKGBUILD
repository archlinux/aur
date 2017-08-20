# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/raspberrypi_tempmon
pkgname=rpi_tempmon
pkgver=1.4
pkgrel=5
pkgdesc="Raspberry pi ARM, CPU GPU temperature monitor with various functions, python 3"
depends=()
arch=('any')
url="https://github.com/gavinlyonsrepo/raspberrypi_tempmon"
license=('GPL')
optdepends=('ssmtp' 'python-matplotlib')
source=("https://github.com/gavinlyonsrepo/raspberrypi_tempmon/archive/$pkgver.tar.gz")

md5sums=('9189f1fa7e7d235cb83c0af0d957c202')

package() {
    cd "$srcdir/raspberrypi_tempmon-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
    
    #readme
    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"

}

