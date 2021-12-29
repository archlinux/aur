# Maintainer: gardenapple <gardenapple at posteo.net>

pkgname=agregore-browser-bin
_pkgver=1.0.0-47
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='A minimal web browser for the distributed web'
arch=('x86_64' 'i686' 'aarch64')
url='https://github.com/AgregoreWeb/agregore-browser'
license=('AGPL3')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
source_x86_64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$_pkgver/agregore-browser_${_pkgver}_amd64.deb")
source_aarch64=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$_pkgver/agregore-browser_${_pkgver}_arm64.deb")
source_i686=("https://github.com/AgregoreWeb/agregore-browser/releases/download/v$_pkgver/agregore-browser_${_pkgver}_i386.deb")

package() {
	tar xf data.tar.xz --directory="$pkgdir"

	install -d "${pkgdir}/usr/bin"
	ln -s '/opt/Agregore Browser/agregore-browser' "${pkgdir}/usr/bin/agregore-browser"

	mv "${pkgdir}/usr/share/icons/hicolor/0x0/apps/" "${pkgdir}/usr/share/pixmaps"
	rm -r "${pkgdir}/usr/share/icons"
}
b2sums_x86_64=('297cda10ae3dadf5040686b441ee6426664ebe8dc26ffc72bf62954b0305e0175775f87273ce611fd2dd084063ee42e8f984afffe54d9263b962f01c62c5143a')
b2sums_i686=('aecf8a6a3bcedd138ab97a1858169c1bd075f824c27670231bb81b6735ae00999b90b3d1ded44ab8c2f4e034898754c961cfce5aea427a0d573afc533b92c822')
b2sums_aarch64=('dbcf2f156e15921d17eeeeefb8d06daf65c1d4fd698f1278b55323347a7efa0159152c47e2f2f1e0364d964773ae0ab5cf74ecbcd71b66e5113e9d6f629c2ad3')
