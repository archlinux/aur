# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=agregore-browser-bin
pkgver=1.9.0
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
# no longer offer anything other than x86_64
# arch=('x86_64' 'i686' 'aarch64')
arch=('x86_64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$pkgver/agregore-browser-${pkgver}-linux-amd64.deb")

package() {
	tar xf data.tar.xz --directory="$pkgdir"

	install -d "${pkgdir}/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "${pkgdir}/usr/bin/agregore-browser"

	mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/" "${pkgdir}/usr/share/pixmaps"
	rm -r "${pkgdir}/usr/share/icons"
}
b2sums_x86_64=('32102732f168e6a7bc4528d03e180215e1fff0dd760eca3e3869f121609d9b9e0b22b94d0dc33ed3374134c1955f03fa5b6f7409038d45dde0c13a31659f4d5e')
