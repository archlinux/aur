pkgname=mailspring-current
pkgver=1.5.7
pkgrel=1
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of 
the original authors."
arch=('x86_64')
license=('custom: GPL3 and (C) 2016-2017 Foundry 376, LLC.')
url="https://getmailspring.com/"
options=('!strip')

source=()
sha256sums_x86_64=('59ae0732715e0c51846eb2a0f26a294f517ce7114faf57e90efe883dc05bfca2')

source_x86_64=("https://github.com/Foundry376/Mailspring/releases/download/${pkgver}/mailspring-${pkgver}-amd64.deb")
depends=("libgnome-keyring" "gnome-keyring" "libxss" "libtool" "c-ares" 
"ctemplate" "tidy" "libxkbfile" "libsecret" "gconf" "gtk3" "nss" 
"libglvnd")

optdepends=('libappindicator-gtk3: for system tray support')

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

	chmod -R go-w "${pkgdir}"/usr
}
