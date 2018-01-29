# Maintainer: Joakim Nylén <me@jnylen.nu>
# Contributor: ahrs

pkgname=mailspring
_pkgver=1.1.1
_pkghash=c42b184
pkgver=${_pkgver}.${_pkghash}
pkgrel=1
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('custom: GPL3 and (C) 2016-2017 Foundry 376, LLC.')
url="https://getmailspring.com/"
options=('!strip' '!upx')

source=()
sha256sums=()
sha256sums_x86_64=('7557ca9cdee173e65840fff5fe80923ffceb3900453ab03ab4bb07d443e54b83')

source_x86_64=("https://github.com/Foundry376/Mailspring/releases/download/${_pkgver}/mailspring-${_pkgver}-amd64.deb")
depends=("libgnome-keyring" "gnome-keyring" "libxss" "libtool" "c-ares" "ctemplate" "icu" "libxext" "openssl" "tidy" "libxtst" "libxkbfile" "glib2" "glibc" "libxml2" "libutil-linux" "libsecret" "gconf")

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

	chmod -R go-w "${pkgdir}"/usr
}
