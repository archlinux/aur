# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=agregore-browser-bin
pkgver=1.5.0
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
b2sums_x86_64=('b79b61397fd3fcbd6b61324812c4c4b343ee26e349dafb71367175d5b62ab4cd87e474a96c09b4a1c5e2c0188379e2f160c6a0ab7c8b7375714640e752a268f9')
