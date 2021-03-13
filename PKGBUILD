# Maintainer: Matthias Steffen aur@matthiassteffen.biz

pkgname=mailspring-libre
pkgver=1.8.0_libre
pkgrel=1
pkgdesc="A fork of a fork – aiming at removing Mailspring's dependecy on a central server."
arch=('x86_64')
license=('custom: GPL3 and (C) 2016-2019 Foundry 376, LLC.')
url="https://github.com/notpushkin/Mailspring-Libre"
options=('!strip')

source=()
sha256sums_x86_64=('5cf5cf6cd541df6f50db3529c113ab19943ea43d17909a7997e2fb0ccfb1ca31')

source_x86_64=("https://github.com/notpushkin/Mailspring-Libre/releases/download/1.8.0-libre/mailspring-1.8.0-libre-amd64.deb")
depends=("libxss" "libxkbfile" "libsecret" "gtk3" "nss" "libglvnd")

optdepends=('libappindicator-gtk3: for system tray support' "libgnome-keyring: keyrings" "gnome-keyring: keyrings" )
conflicts=('mailspring')

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

	chmod -R go-w "${pkgdir}"/usr
}
