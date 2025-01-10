# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=bit4id-ipki
pkgver=1.4.10.542
pkgrel=3
pkgdesc="Bit4ID Universal Middleware (Smart Card driver)"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.bit4id.com/"
install=$pkgname.install
# bit4id-xpki also provides /usr/lib/bit4id/libbit4xpki.so
conflicts=('bit4id-xpki')
options=('!strip')

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('8ba2c1136d1b5cf005abf72e378d635a')
else
    ARCH='i386'
    md5sums=('03d84d958ed1ddaf27c2d1e12b43bdd8')
fi

_file_name=$pkgname'_'$pkgver'-1_'$ARCH'.deb'
source=('http://repository.infonotary.com/install/linux/DEBS22/pool/non-free/b/bit4id-ipki/'$_file_name)

package() {
    ar -xv $_file_name || return 1
    tar -xvf data.tar.xz -C $pkgdir || return 1
}
