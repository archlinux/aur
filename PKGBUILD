# Maintainer: Matthias Steffen aur@matthiassteffen.biz

pkgname=mailspring-libre
pkgver=1.7.2_libre1
pkgrel=1
pkgdesc="A fork of a fork – aiming at removing Mailspring's dependecy on a central server."
arch=('x86_64')
license=('custom: GPL3 and (C) 2016-2019 Foundry 376, LLC.')
url="https://github.com/notpushkin/Mailspring-Libre"
options=('!strip')

source=()
sha256sums_x86_64=('cdeb12a859890309e4ad08c6577363dd2e87e7c5e0363336e9d4adda2488295f')

source_x86_64=("https://u.ale.sh/mailspring-1.7.2-amd64.libre1.deb")
depends=("libxss" "libxkbfile" "libsecret" "gtk3" "nss" "libglvnd")

optdepends=('libappindicator-gtk3: for system tray support' "libgnome-keyring: keyrings" "gnome-keyring: keyrings" )

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

	chmod -R go-w "${pkgdir}"/usr
}
