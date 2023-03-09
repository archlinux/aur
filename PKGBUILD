# Maintainer: liyp <my@liyp.cc>
pkgname=tidgi-bin
_pkgname=tidgi
pkgver=0.7.14
conflicts=('tidgi')
pkgrel=2
pkgdesc="Customizable personal knowledge-base with Github as unlimited storage and blogging platform."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/tiddly-gittly/TidGi-Desktop"

license=('MPL2')

depends=('nodejs' 'alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'gvfs' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'openssl' 'pango' 'trash-cli' 'xdg-utils' 'zlib')

makedepends=('zstd')

source_i686=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_x86_64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha512sums_i686=('280b5dc53c3d553855bb886f0798da19aed745653fbe53d8ae479df74da72ddce5cc0affb9ef05dd19f761221cc178567426a634dcd551508908861e9ca21490')
sha512sums_x86_64=('280b5dc53c3d553855bb886f0798da19aed745653fbe53d8ae479df74da72ddce5cc0affb9ef05dd19f761221cc178567426a634dcd551508908861e9ca21490')
sha512sums_aarch64=('22de9a3cbf8b5922d7fdc689232425f96b4cf52b65c3c584781f29e7e0863b3b6047f449876607f664dec7d8ab152d173a3a25c225bb7754625552499f25b303')


package(){
	# Extract package data
	tar --zstd -xvf data.tar.zst --directory "${pkgdir}"
	cd "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/lib/tidgi/resources/node_modules/zx/node_modules/yaml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/tidgi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	rm -rf "${pkgdir}/usr/share/lintian"

}
