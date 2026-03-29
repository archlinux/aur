# Maintainer: Your Name <mehad605@gmail.com>
pkgname=bangla-typer-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Desktop Bangla typing trainer"
arch=('x86_64')
url="https://github.com/mehad605/Bangla_Typer"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator')
provides=('bangla-typer')
conflicts=('bangla-typer')
install='bangla-typer.install'

_pkgname="${pkgname%-bin}"
source=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('68bb65579fc0c4e5ed5d9518e103ecb4bee652edbd265929f0a6ce3af46399a8')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}" \
        "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-server" \
        "${pkgdir}/usr/bin/${_pkgname}-server"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${_pkgname}.desktop" <<-'DESKTOP'
	[Desktop Entry]
	Name=Bangla Typer
	Exec=bangla-typer
	Icon=bangla-typer
	Terminal=false
	Type=Application
	Categories=Utility;
	DESKTOP

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg" <<-'SVG'
	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
	  <rect width="512" height="512" rx="64" fill="#2563eb"/>
	  <text x="256" y="320" font-family="sans-serif" font-size="280" font-weight="bold" fill="white" text-anchor="middle">ব</text>
	</svg>
	SVG
}
