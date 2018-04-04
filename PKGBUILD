# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/raspberrypi_tempmon
pkgname=rpi_tempmon
pkgver=2.0
pkgrel=1
pkgdesc="Raspberry pi, CPU GPU temperature monitor with various functions, python 3"
depends=()
arch=('any')
url="https://github.com/gavinlyonsrepo/raspberrypi_tempmon"
license=('GPL')
optdepends=('ssmtp' 'python-matplotlib')
source=("https://github.com/gavinlyonsrepo/raspberrypi_tempmon/archive/$pkgver.tar.gz")

md5sums=('2c1dd48352a517c0f47144822106fdf8')

package() {
    cd "$srcdir/raspberrypi_tempmon-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
    
    #readme
    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"
}

