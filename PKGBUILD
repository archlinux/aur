# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=infonotary-client-software
pkgver=2.0.3
pkgrel=9
pkgdesc="InfoNotary client software - InfoNotary e-Doc Signer and InfoNotary Smart Card Manager."
arch=('x86_64')
url="http://www.infonotary.com/"
license=('unknown')
depends=(qt5-base qt5-xmlpatterns nss openssl libldap-2.5)
replaces=(infonotary-scardmanager)
conflicts=(infonotary-scardmanager)
optdepends=(
	'ccid: generic USB Chip/Smart Card Interface Devices driver'
	'omnikey_ifdokccid: driver for OmniKey smart card readers'
	'bit4id-ipki: Bit4ID Universal Middleware (Smart Card driver)'
	'bit4id-xpki: Bit4ID Universal Middleware (Smart Card driver)'
	'pcsclite: smartcard middleware library (pcscd)'
	'pcsc-tools: smartcard tools (pcsc_scan)'
	'opensc: a set of libraries and utilities to work with smart cards'
)
source=('http://repository.infonotary.com/install/linux/DEBS22/pool/non-free/i/infonotary-client-software/infonotary-client-software_'$pkgver'.1198_amd64.deb')
md5sums=('942ed036b2e75b7660f008a99b857618')
install=$pkgname.install

package() {
	ar -xv *.deb || return 1
	tar -xvf data.tar.[xg]z -C $pkgdir || return 1
}
