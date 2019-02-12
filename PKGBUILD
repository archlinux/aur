# Maintainer: Rashintha Maduneth <rashinthamaduneth@gmail.com>
# Maintainer: Dhananjay Balan <mail@dbalan.in>
# Contributor: ahrs

pkgname=mailspring
pkgver=1.5.6
pkgrel=1
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('custom: GPL3 and (C) 2016-2017 Foundry 376, LLC.')
url="https://getmailspring.com/"
options=('!strip')

source=()
sha256sums_x86_64=('544bed707867d4a2bbe1afccd3b36a2ea12b180ed06b371f13392ed06207e8e4')

source_x86_64=("https://github.com/Foundry376/Mailspring/releases/download/${pkgver}/mailspring-${pkgver}-amd64.deb")
depends=("libgnome-keyring" "gnome-keyring" "libxss" "libtool" "c-ares" "ctemplate" "tidy" "libxkbfile" "libsecret" "gconf" "gtk3" "nss" "libglvnd")

optdepends=('libappindicator-gtk3: for system tray support')

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

	chmod -R go-w "${pkgdir}"/usr
}
