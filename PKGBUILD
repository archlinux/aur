# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=agregore-browser-bin
_pkgver=1.0.0-70
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
b2sums_x86_64=('789d43e26285587bbfa8984d08ab51a893612ee36937e2f871c305e5f336b47a6a5e1a202a1144f54e280485869453d8b086f3977e0041d9113a25ac8bbd822d')
