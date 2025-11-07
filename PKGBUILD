# Maintainer: Ada Tretyakova <ada@ada-af.com>
pkgname=dion-bin
pkgver=5.27.1
pkgrel=2311
pkgdesc="Desktop application for dion.vc"
arch=("x86_64")
url="https://dion.vc"
license=('MIT')
depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libappindicator-gtk3" "libsecret")
source=("https://static.dion.vc/desktop_app/dion_${pkgver}_amd64.deb")
sha256sums=("83d9288ddba8295c8f5933396ccfb5708b82105c65614c7a21f84db54a3ae963")

prepare() {
	bsdtar -xvf "${srcdir}/data.tar.xz"
}

package() {
	cp -r "${srcdir}/opt" "${pkgdir}/opt"
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s /opt/Dion/dion "${pkgdir}/usr/bin/dion"
}
