# Maintainer: Kedap <kedap.dev@protonmail.com>
pkgname=kali-archive-keyring
pkgver=2024.1
pkgrel=1
pkgdesc="GnuPG archive keys of the Kali archive"
arch=('any')
url="https://pkg.kali.org/pkg/kali-archive-keyring"
license=('GPL')
source=("https://gitlab.com/kalilinux/packages/${pkgname}/-/archive/kali/${pkgver}/${pkgname}-kali-${pkgver}.tar.gz")
sha256sums=('48f2e6080e20cba1959865aba26e17dc7252d1b237ee7f69f30009268cc5cbe5')
build() {
	cd "${pkgname}-kali-${pkgver}"
	make
}

package() {
	cd "${pkgname}-kali-${pkgver}"
	install -Dm 644 "${pkgname}.gpg" -t ${pkgdir}/usr/share/keyrings/
}
