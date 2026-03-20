# Maintainer: Ada Tretyakova <ada@ada-af.com>
pkgname=dion-bin
pkgver=5.29.1
pkgrel=3309
pkgdesc="Desktop application for dion.vc"
arch=("x86_64")
url="https://dion.vc"
license=('MIT')
depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libappindicator-gtk3" "libsecret")
source=("https://static.dion.vc/desktop_app/dion_${pkgver}_amd64.deb")
sha256sums=("0eb113b40468f342d931e027488e0cc27d6c32fe7f64c257a9f6e7d78a49548a")

prepare() {
	bsdtar -xvf "${srcdir}/data.tar.xz"
}

package() {
	cp -r "${srcdir}/opt" "${pkgdir}/opt"
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s /opt/Dion/dion "${pkgdir}/usr/bin/dion"
}
