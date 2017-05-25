# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=bit4id-ipki
pkgver=1.4.3.303
pkgrel=1
pkgdesc="Bit4ID Universal Middleware (Smart Card driver)"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.bit4id.com/"
install=$pkgname.install

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('fde591fbc72566e94ace363780ab6f2e')
else
    ARCH='i386'
    md5sums=('53fba4d8ae498df319fe9771dafc560d')
fi

_file_name=$pkgname'_'$pkgver'-1_'$ARCH'.deb'
source=('http://repository.infonotary.com/install/linux/DEBS-2016-11-01/pool/non-free/b/bit4id-ipki/'$_file_name)

package() {
    ar -xv $_file_name || return 1
    tar -xvf data.tar.gz -C $pkgdir || return 1
}
