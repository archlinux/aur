# Maintainer: Ada Tretyakova <ada@ada-af.com>
pkgname=dion-bin
pkgver=5.30.1
pkgrel=3557
pkgdesc="Desktop application for dion.vc"
arch=("x86_64")
url="https://dion.vc"
license=('MIT')
depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libappindicator-gtk3" "libsecret")
source=("https://static.dion.vc/desktop_app/dion_${pkgver}_amd64.deb")
sha256sums=("c8d30c0e7a8ca433bf16ef0e12c40ee2392b24eb1f4ec4980f43f5d578a82622")

prepare() {
	bsdtar -xvf "${srcdir}/data.tar.xz"
}

package() {
	cp -r "${srcdir}/opt" "${pkgdir}/opt"
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s /opt/Dion/dion "${pkgdir}/usr/bin/dion"
}
