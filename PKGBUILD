# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=agregore-browser-bin
_pkgver=1.0.0-65
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
# no longer offer anything other than x86_64
# arch=('x86_64' 'i686' 'aarch64')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$_pkgver/agregore-browser-${_pkgver}-linux-amd64.deb")

package() {
	tar xf data.tar.xz --directory="$pkgdir"

	install -d "${pkgdir}/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "${pkgdir}/usr/bin/agregore-browser"

	mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/" "${pkgdir}/usr/share/pixmaps"
	rm -r "${pkgdir}/usr/share/icons"
}
b2sums_x86_64=('0a0a5ecffafd3dd23803239cb5dbd784eb550b1d3b8ab43c35fa37583cabd2320e20a6669ca1c8058aa08a0a7024b68d75e1db107ec49029419995794ffa6a38')
