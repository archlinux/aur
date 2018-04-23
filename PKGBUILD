# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/raspberrypi_tempmon
pkgname=rpi_tempmon
pkgver=2.1
pkgrel=2
pkgdesc="Raspberry pi, CPU GPU temperature monitor with various functions, python 3"
depends=()
arch=('any')
url="https://github.com/gavinlyonsrepo/raspberrypi_tempmon"
license=('GPL')
optdepends=('ssmtp' 'python-matplotlib' 'libnotify' 'sysbench' 'python-psutil')
source=("https://github.com/gavinlyonsrepo/raspberrypi_tempmon/archive/$pkgver.tar.gz")

md5sums=('95b60f4e7f0fe19e0b3c6bd094702f92')

package() {
    cd "$srcdir/raspberrypi_tempmon-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir"
    
    #readme
    install -D -m644 README.md "$pkgdir/usr/share/doc/${pkgname}/Readme.md"
}

