# Maintainer: Kedap <kedap.dev@protonmail.com>
pkgname=kali-archive-keyring
pkgver=2022.1
pkgrel=1
pkgdesc="GnuPG archive keys of the Kali archive"
arch=('any')
url="https://pkg.kali.org/pkg/kali-archive-keyring"
license=('GPL')
source=("https://gitlab.com/kalilinux/packages/${pkgname}/-/archive/kali/2022.1/${pkgname}-kali-${pkgver}.tar.gz")
sha256sums=('b5c6a527945cdf1702c10e2d358ab34739c24b2ddd50f6a52173f7c250025c32')
build() {
	cd "${pkgname}-kali-${pkgver}"
	make
}

package() {
	cd "${pkgname}-kali-${pkgver}"
	install -Dm 644 "${pkgname}.gpg" -t ${pkgdir}/usr/share/keyrings/
}