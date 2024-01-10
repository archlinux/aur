# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nate Fortner <aur@nefortner.com>
pkgname=nmap-automator-git
_pkgname=nmap-automator
pkgver=c5e15de8429c78aa5923010145dfac0996aba9e1
pkgrel=1
epoch=
pkgdesc="nmap wrapper/automation tool for pentesting"
arch=("any")
url="https://github.com/21y4d/nmapAutomator"
license=('MIT')
groups=()
depends=('nmap')
makedepends=()
checkdepends=()
optdepends=('ffuf: for ffuf scans'
			'gobuster: for gobuster scans'
			'nikto: for nikto scans'
			'smbmap: for smbmap scans'
			'sslscan: for sslscan scans'
			'droopescan: for droopescan scans'
			'smtp-user-enum: for smtp-user-enum scans'
			'snmp-check: for snmp-check scans'
			'snmpwalk: for snmpwalk scans'
			'ldapsearch: for ldapsearch scans'
			'odat: for odat scans'
			'dnsrecon: for dnsrecon scans'
			'joomscan: for joomscan scans'
			'whatweb: for whatweb scans'
			'wfuzz: for wfuzz scans'
			'wpscan: for wpscan scans'
			'zaproxy: for zaproxy scans')
provides=("nmapAutomator")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${_pkgname}::git+https://github.com/21y4d/nmapAutomator/#branch=master")
noextract=()
# md5sums=()
validpgpkeys=()

# prepare() {
# 	cd "$pkgname-$pkgver"
# 	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
# }

# # build() {
# # 	cd "$pkgname-$pkgver"
# # 	./configure --prefix=/usr
# # 	make
# # }
sha256sums=("SKIP")
check() {
	cd "${_pkgname}"
	test nmapAutomator.sh
}

package() {
	cd "${_pkgname}"
	install -Dm755 nmapAutomator.sh "${pkgdir}/usr/local/bin/nmapAutomator"
}

pkgver() {
	cd $_pkgname
	git rev-parse HEAD
}
