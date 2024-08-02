# Maintainer: Ada Tretyakova <ada@ada-af.com>
pkgname=dion-bin
pkgver=5.13.0
pkgrel=12497
pkgdesc="Desktop application for dion.vc"
arch=("x86_64")
url="https://diongo.ru"
license=('MIT')
depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libappindicator-gtk3" "libsecret")
source=("https://static.dion.vc/desktop_app/dion_${pkgver}_amd64.deb")
sha256sums=("9f58a821ac6cbc96604ec7ced0f846f3b8b214a8b9636a27a2cc335f243b2964")

prepare() {
	bsdtar -xvf "${srcdir}/data.tar.xz"
}

package() {
	cp -r "${srcdir}/opt" "${pkgdir}/opt"
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s /opt/Dion/dion "${pkgdir}/usr/bin/dion"
}
