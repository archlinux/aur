# Maintainer: Ramadan Ali <rot13ezqa@ezqa.ny>
_pkgname=uyapeditor
pkgname=${_pkgname}-bin
pkgver=5.0.1
pkgrel=1
pkgdesc="UYAP Document Editor, UYAP Template Editor"
arch=("x86_64")
url="https://uyap.gov.tr/UYAP-Editor"
license=("custom")
depends=("pcsclite" "jre11-openjdk")
optdepends=("akia: sign UYAP documents"
	    "jre=8: sign UYAP documents")
provides=("$_pkgname=$pkgver")
conflicts=("uyap")
source=("https://rayp.adalet.gov.tr/resimler/2/dosya/uyap-pardus02-12-202012-08-pm.zip")
sha1sums=("64aa327e4fc54fad61f6f3033780c4295d7c7c6e")

prepare() {
	find . -type f -name $_pkgname*$pkgver*.deb
	find . -type f -name $_pkgname*$pkgver*.deb -exec bsdtar -xf {} \; &&
	[[ -e $srcdir/data.tar.xz ]] &&
	bsdtar -xf $srcdir/data.tar.xz
}

package() {
	mv $srcdir/usr $pkgdir/usr
}
