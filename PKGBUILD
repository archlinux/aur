# Contributor: liyp <my@liyp.cc>
# Maintainer: tee < teeaur at duck dot com >
pkgname=tidgi-bin
_pkgname=tidgi
pkgver=0.12.1
provides=('tidgi')
conflicts=('tidgi')
pkgrel=1
pkgdesc="Customizable personal knowledge-base with Github as unlimited storage and blogging platform."
arch=('i686' 'x86_64' 'aarch64')
url='https://tidgi.fun'
_src="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL2')
depends=('nodejs' 'alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'gvfs' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'openssl' 'pango' 'trash-cli' 'xdg-utils' 'zlib')
source_i686=("$_src/releases/download/v${pkgver}-update/${_pkgname}_${pkgver}_amd64.deb")
source_x86_64=("$_src/releases/download/v${pkgver}-update/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("$_src/releases/download/v${pkgver}-update/${_pkgname}_${pkgver}_arm64.deb")
sha512sums_i686=('aa4f441dcf6fd55d62a9de8b59792397e85d0de61fb4886aecef301873c0f1b6dd2236062e4fe577bfbaeac7d9eb63a27d1a127d7b4cb7dc7d648579c11f7c70')
sha512sums_x86_64=('aa4f441dcf6fd55d62a9de8b59792397e85d0de61fb4886aecef301873c0f1b6dd2236062e4fe577bfbaeac7d9eb63a27d1a127d7b4cb7dc7d648579c11f7c70')
sha512sums_aarch64=('8a27b6069608896ccc2dddf87389b8accdcfc8136521f2ac2cf618c81532d82fbe7e84db490fd29cec68ef2a2d99a2c2584338eb1dac63208af05352614652a0')

package(){
	# Extract package data
	tar --zstd -xvf data.tar.xz --directory "${pkgdir}"
	cd "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/lib/tidgi/resources/node_modules/zx/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/tidgi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	rm -rf "${pkgdir}/usr/share/lintian"
}
# vim:set noet sts=0 sw=4 ts=4 ft=PKGBUILD:
