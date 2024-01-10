# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Nate Fortner <aur@nefortner.com>
pkgname=nmap-automator-git
_pkgname=nmap-automator
pkgver=r168.c5e15de
pkgrel=1
epoch=
pkgdesc="nmap wrapper/automation tool for pentesting"
arch=("any")
url="https://github.com/21y4d/nmapAutomator"
license=('MIT')
groups=()
depends=('nmap')
makedepends=('git')
checkdepends=()
optdepends=('ffuf: for web scans'
			'gobuster: for web scans'
			'nikto: for web scans'
			'smbmap: for smb scans'
			'sslscan: for ssl scans'
			'droopescan: for web scans'
			'smtp-user-enum: for smtp scans'
			'snmpcheck: for snmp scans'
			'net-snmp: for snmp scans'
			'openldap: for ldap scans'
			'odat: for oracle scans'
			'dnsrecon: for dns scans'
			'joomscan: for joomla framework scans'
			'whatweb: for web scans'
			'wfuzz: for web scans'
			'wpscan: for wordpress scans'
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
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
