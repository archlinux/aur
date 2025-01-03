# Contributor: liyp <my@liyp.cc>
# Maintainer: tee < teeaur at duck dot com >
pkgname=tidgi-bin
_pkgname=tidgi
pkgver=0.11.3
provides=('tidgi')
conflicts=('tidgi')
pkgrel=1
pkgdesc="Customizable personal knowledge-base with Github as unlimited storage and blogging platform."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL2')
depends=('nodejs' 'alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'gvfs' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'openssl' 'pango' 'trash-cli' 'xdg-utils' 'zlib')
source_i686=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_x86_64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha512sums_i686=('45ce8844c63a5004c794246b8f89faee4635bc8a0cb418dcc641cb1aeb803151132b831c9ca52e0acf51c6916070f522de8e24e2e63e76db294de2f5c9eb1b4c')
sha512sums_x86_64=('45ce8844c63a5004c794246b8f89faee4635bc8a0cb418dcc641cb1aeb803151132b831c9ca52e0acf51c6916070f522de8e24e2e63e76db294de2f5c9eb1b4c')
sha512sums_aarch64=('4df77b77c308c8d78a327dcde6d98aef989b8da88e3f4d6b708355e69cf443559bd769a432f86b3ac14f0bb2d025d9645539ee802f43b33caaa243a359ac40f7')

package(){
	# Extract package data
	tar --zstd -xvf data.tar.xz --directory "${pkgdir}"
	cd "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/lib/tidgi/resources/node_modules/zx/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/tidgi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	rm -rf "${pkgdir}/usr/share/lintian"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
