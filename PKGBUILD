# Maintainer: Joakim Nylén <me@jnylen.nu>
# Contributor: ahrs

pkgname=mailspring
pkgver=1.0.4
pkgrel=2
pkghash=e604c991
pkgdesc="A beautiful, fast and maintained fork of Nylas Mail by one of the original authors."
arch=('x86_64')
license=('GPL3')
url="https://getmailspring.com/"
options=('!strip' '!upx')

source=()
sha256sums=()
sha256sums_x86_64=('b7f86416ab26025c070d154cec20fae3217a4f425efe2511976df398b1de6dae')

source_x86_64=("https://mailspring-builds.s3.amazonaws.com/client/${pkghash}/linux/mailspring-${pkgver}-amd64.deb")
depends=("libgnome-keyring" "libtool" "c-ares" "ctemplate" "icu" "libxext" "openssl" "tidy" "libxtst" "libxkbfile" "glib2" "glibc" "libxml2" "libutil-linux" "libsecret" "gconf")

package() {
	cd ${srcdir}

	tar -xvf data.tar.xz -C ${pkgdir} --exclude='./control'

	chmod -R go-w "${pkgdir}"/usr
}
