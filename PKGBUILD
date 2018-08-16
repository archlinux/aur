# Maintainer: Joakim Nylén <me@jnylen.nu>
# Contributor: ahrs

pkgname=mailspring
_pkgver=1.4.2
pkgver=${_pkgver}
pkgrel=1
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('custom: GPL3 and (C) 2016-2017 Foundry 376, LLC.')
url="https://getmailspring.com/"
options=('!strip')

source=()
sha256sums=()
sha256sums_x86_64=('a32c8d4673763f7dc3edde481e68b2c3d178614fdf497b5c032c4f3b6a023b23')

source_x86_64=("https://github.com/Foundry376/Mailspring/releases/download/${_pkgver}/mailspring-${_pkgver}-amd64.deb")
depends=("libgnome-keyring" "gnome-keyring" "libxss" "libtool" "c-ares" "ctemplate" "tidy" "libxkbfile" "libsecret" "gconf" "gtk2" "nss")

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

	chmod -R go-w "${pkgdir}"/usr
}
