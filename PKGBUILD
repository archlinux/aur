# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/raspberrypi_tempmon
pkgname=rpi_tempmon
pkgver=1.3
pkgrel=4
pkgdesc="Raspberry pi ARM, CPU GPU temperature monitor with various functions, Bash and python"
depends=()
arch=('any')
url="https://github.com/gavinlyonsrepo/raspberrypi_tempmon"
license=('GPL')
optdepends=('ssmtp' 'python-matplotlib')
source=("https://github.com/gavinlyonsrepo/raspberrypi_tempmon/archive/$pkgver.tar.gz")

md5sums=('0b2b1e0f7e06d4e4aacb27255cf6a951')
package() {
    cd "$srcdir/raspberrypi_tempmon-${pkgver}"
    install -D -m755 src/rpi_tempmon.sh "$pkgdir"/usr/bin/"${pkgname}" 
    
    install -d  "$pkgdir"/usr/lib/rpi_tempmon/
    install -D -m755  modules/* "$pkgdir"/usr/lib/rpi_tempmon
}
