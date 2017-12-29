# Maintainer: Joakim Nylén <me@jnylen.nu>
# Contributor: ahrs

pkgname=mailspring
_pkgver=1.0.12
_pkghash=cf081332
pkgver=${_pkgver}.${_pkghash}
pkgrel=1
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('custom: GPL3 and (C) 2016-2017 Foundry 376, LLC.')
url="https://getmailspring.com/"
options=('!strip' '!upx')

source=()
sha256sums=()
sha256sums_x86_64=('62e44f780617c8ec6705dee8287413efa7651a6015c8cebbffff062f575be19a')

source_x86_64=("https://mailspring-builds.s3.amazonaws.com/client/${_pkghash}/linux/mailspring-${_pkgver}-amd64.deb")
depends=("libgnome-keyring" "gnome-keyring" "libxss" "libtool" "c-ares" "ctemplate" "icu" "libxext" "openssl" "tidy" "libxtst" "libxkbfile" "glib2" "glibc" "libxml2" "libutil-linux" "libsecret" "gconf")

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

	chmod -R go-w "${pkgdir}"/usr
}
