# Maintainer: Felix Singer

pkgname="mkinitcpio-openssh"
pkgver=r3.0c952c0
pkgrel=1
pkgdesc="openssh mkinitcpio hook"
arch=('any')
url="https://github.com/felixsinger/mkinitcpio-openssh"
license=('GPL3')
depends=('openssh')
optdepends=()
conflicts=('mkinitcpio-tinyssh' 'mkinitcpio-dropbear')
install=${pkgname}.install
source=("git+https://github.com/felixsinger/mkinitcpio-openssh.git")
sha512sums=('SKIP')

pkgver() {
	cd ${srcdir}/${pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -m700 -d "${pkgdir}/etc/ssh-initrd"

	touch "${pkgdir}/etc/ssh-initrd/authorized_keys"
	chmod 600 "${pkgdir}/etc/ssh-initrd/authorized_keys"
}
