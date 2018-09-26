# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=infonotary-client-software
pkgver=2.0.3
pkgrel=3
pkgdesc="InfoNotary client software - InfoNotary e-Doc Signer and InfoNotary Smart Card Manager."
arch=('i686' 'x86_64')
url="http://www.infonotary.com/"
license=('unknown')
depends=(qt5-base nss openssl)
replaces=(infonotary-scardmanager)
conflicts=(infonotary-scardmanager)
optdepends=(
	'ccid: generic USB Chip/Smart Card Interface Devices driver'
	'omnikey_ifdokccid: driver for OmniKey smart card readers'
	'bit4id-ipki: driver for T&S DS/2048 (L) smart cards'
	'pcsclite: smartcard middleware library (pcscd)'
	'pcsc-tools: smartcard tools (pcsc_scan)'
	'opensc: a set of libraries and utilities to work with smart cards'
)
install=$pkgname.install

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('9d8464d76f9d09e62aa4575534dbc045')
else
    ARCH='i386'
    md5sums=('fff941e2412b9b4dd2ca0de68df20a59')
fi

_file_name=$pkgname'_'$pkgver'.923_'$ARCH'.deb'
source=('http://repository.infonotary.com/install/linux/DEBS/pool/non-free/i/infonotary-client-software/'$_file_name)

package() {
    ar -xv $_file_name || return 1
	tar -xvf data.tar.[xg]z -C $pkgdir || return 1
}
