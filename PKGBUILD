# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=bit4id-ipki
pkgver=1.4.3.303
pkgrel=2
pkgdesc="Bit4ID Universal Middleware (Smart Card driver)"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.bit4id.com/"
install=$pkgname.install
options=('!strip')

if [ "${CARCH}" = 'x86_64' ]; then
	ARCH='amd64'
	md5sums=('7c789da30a0e0f59ff7f888be2fdbe99')
else
	ARCH='i386'
	md5sums=('08d5823936d9d232523adb05b4819b0e')
fi

_file_name=$pkgname'_'$pkgver'-2_'$ARCH'.deb'
source=('http://repository.infonotary.com/install/linux/DEBS/pool/non-free/b/bit4id-ipki/'$_file_name)

package() {
	ar -xv $_file_name || return 1
	tar -xvf data.tar.[xg]z -C $pkgdir || return 1
}
