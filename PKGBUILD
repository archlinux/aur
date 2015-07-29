# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=bit4id-ipki
pkgver=1.2.15
pkgrel=3
pkgdesc="Bit4ID Universal Middleware (Smart Card driver)"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.bit4id.com/"
install=$pkgname.install

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('8344ea2825eaea01d84749039a68040b')
else
    ARCH='i386'
    md5sums=('6735636391df49bfe1804a30bfaff6d0')
fi

_file_name=$pkgname'_'$pkgver'-1_'$ARCH'.deb'
source=('http://repository.infonotary.com/install/linux/DEBS/pool/non-free/b/bit4id/'$_file_name)

package() {
    ar -xv $_file_name || return 1
    tar -xvf data.tar.gz -C $pkgdir || return 1
}
