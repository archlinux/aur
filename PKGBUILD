# Maintainer: DisableGraphics elchifladod@gmail.com
pkgbase="eslauncher2"
pkgname="eslauncher2"
pkgcompletename="ESLauncher2"
pkgrel=1
pkgver=0.8.5
pkgdesc="The next generation Endless Sky Launcher"
arch=('any')
url="https://github.com/EndlessSkyCommunity/ESLauncher2"
license=('GPL-3.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bb6905059dc68fec35810726e2721edd8b1c5db67ffe951c08b0332b70ab153bdf18bc734a4c886ff9e3a579ee2b5e6ac50e70fe5d70180c63cd7272c8b1d593')

build() {
	cd ${pkgcompletename^}-${pkgver}
	cargo build
}

package() {
	install -Dm755 ${pkgcompletename^}-${pkgver}/target/debug/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 ${pkgcompletename^}-${pkgver}/icons/icon.ico "${pkgdir}/usr/share/icons/eslauncher2.ico"
	echo "[Desktop Entry]
Name=ESLauncher2
Comment=A program for organizing Endless Sky installations.
Exec=eslauncher2
Icon=/usr/share/icons/eslauncher2.ico
Terminal=false
Type=Application
Categories=Game;" > "${pkgname}.desktop"
	install -Dm755 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}


