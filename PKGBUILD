# Maintainer: Ada Tretyakova <ada@ada-af.com>
pkgname=dion-bin
pkgver=5.12.0
pkgrel=12259
pkgdesc="Desktop application for dion.vc"
arch=("x86_64")
url="https://diongo.ru"
license=('MIT')
depends=("gtk3" "libnotify" "nss" "libxss" "libxtst" "xdg-utils" "at-spi2-core" "util-linux-libs" "libappindicator-gtk3" "libsecret")
source=("https://static.dion.vc/desktop_app/dion_${pkgver}_amd64.deb")
sha256sums=("7bc0b93e75b0b6229b9e772f5bab1f7f6af3cff07ba176319add6b7fae353861")

prepare() {
	bsdtar -xvf "${srcdir}/data.tar.xz"
}

package() {
	cp -r "${srcdir}/opt" "${pkgdir}/opt"
	cp -r "${srcdir}/usr" "${pkgdir}/usr"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s /opt/Dion/dion "${pkgdir}/usr/bin/dion"
}
