# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=libreoffice-online-bin
pkgver=2.0
pkgrel=1
pkgdesc="node-webkit is an app runtime based on Chromium and node.js."
arch=("x86_64")
url="https://cgit.freedesktop.org/libreoffice/online/"
license=("MIT")
provides=("libreoffice-online")
replaces=("libreoffice-online")
conflicts=("libreoffice-online")

source=("https://onny.project-insanity.org/files/libre-office-online-bin.tar.gz"
	"loolwsd.service")
sha512sums=('7c4ec22f5b1f9679aceb989e5ed8cf4769fa5dcc79452983822c1f57c361a9956d21560ef9251838a2e78f66903178320c7d19deeee1dd5689db959fdd0f609b'
	    'ae83dcfe7066a87ab32e975a79f0e04cd70d0ba0d927576f628974b5a2a28b295fffe4d6c5bf2ab3b07dbcab689a03e7c1960ad39fa8704540e14624d95b92ca')

package() {
  cp -r "${srcdir}/etc" "${pkgdir}/"
  cp -r "${srcdir}/opt" "${pkgdir}/"
  cp -r "${srcdir}/usr" "${pkgdir}/"
  install -Dm644 "${srcdir}/loolwsd.service" "${pkgdir}/usr/lib/systemd/system/loolwsd.service"
}
