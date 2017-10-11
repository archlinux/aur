# Maintainer: Joakim Nylén <me@jnylen.nu>
# Contributor: ahrs

pkgname=mailspring
pkgver=1.0.3
pkgrel=2
pkghash=f82c8836
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('GPL3')
url="https://getmailspring.com/"
options=('!strip' '!upx')

source=()
sha256sums=()
sha256sums_x86_64=('e686c39ee9462866eec864b96c519a757677db57c21048fc6cf8577b48ddd6bb')

source_x86_64=("https://mailspring-builds.s3.amazonaws.com/client/${pkghash}/linux/mailspring-${pkgver}-amd64.deb")
depends=("libsasl>=2.0.0" "libgnome-keyring" "libtool" "c-ares" "ctemplate" "icu" "libxext" "openssl" "tidy" "libxtst" "libxkbfile" "glib2" "glibc" "libxml2" "libutil-linux" "libsecret")

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

	chmod -R go-w "${pkgdir}"/usr
}
