# Maintainer: Slavi Pantaleev <s.pantaleev at gmail.com>

pkgname=infonotary-scardmanager
pkgver=2.1.0
pkgrel=5
pkgdesc="Smart Card Manager software by InfoNotary"
arch=('i686' 'x86_64')
url="http://www.infonotary.com/site/?p=doc_l2_3"
license=('unknown')
depends=(openssl098 qt4)
optdepends=(
	'ccid: generic USB Chip/Smart Card Interface Devices driver'
	'omnikey_cardman_x21: driver for OmniKey xx21 smart card readers'
	'libacr38ucontrol: driver for the ACR38 smart card reader'
	'bit4id-ipki: driver for T&S DS/2048 (L) smart cards'
	'pcsclite: smartcard middleware library (pcscd)'
	'pcsc-tools: smartcard tools (pcsc_scan)'
	'opensc: a set of libraries and utilities to work with smart cards'
)
install=$pkgname.install

if [ "${CARCH}" = 'x86_64' ]; then
    ARCH='amd64'
    md5sums=('1c532272f8376a614700f29e95026f44')
else
    ARCH='i386'
    md5sums=('b50465f7dfdc01c9cb4141f339c2653a')
fi

_file_name=$pkgname'_'$pkgver'-1_'$ARCH'.deb'
source=('http://repository.infonotary.com/install/'$_file_name)

package() {
    ar -xv $_file_name || return 1
    tar -xvf data.tar.gz -C $pkgdir || return 1
}
