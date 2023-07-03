# Maintainer: liyp <my@liyp.cc>
pkgname=tidgi-bin
_pkgname=tidgi
pkgver=0.8.0
conflicts=('tidgi')
pkgrel=1
pkgdesc="Customizable personal knowledge-base with Github as unlimited storage and blogging platform."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/tiddly-gittly/TidGi-Desktop"

license=('MPL2')

depends=('nodejs' 'alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'gvfs' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'openssl' 'pango' 'trash-cli' 'xdg-utils' 'zlib')

#makedepends=('zstd')

source_i686=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_x86_64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
sha512sums_i686=('fc246c6463eb980a6fe94818e0998ab7baf2a788aa56a3628841e17e7074896a4f2d2225c9b57543b0bd8f3a383c449a869936573e0873b0b0eb37f8d29e7fd1')
sha512sums_x86_64=('fc246c6463eb980a6fe94818e0998ab7baf2a788aa56a3628841e17e7074896a4f2d2225c9b57543b0bd8f3a383c449a869936573e0873b0b0eb37f8d29e7fd1')
sha512sums_aarch64=('4c5c703c31fdc6f3b10a6fc565d6ecb158ff310462ef84684815edf58afa9ece76744ae500b00d9db5acdc9849df0c248f35385327807cbf9fe889e74f566bec')


package(){
	# Extract package data
	tar --zstd -xvf data.tar.xz --directory "${pkgdir}"
	cd "${pkgdir}"
	install -D -m644 "${pkgdir}/usr/lib/tidgi/resources/node_modules/zx/node_modules/yaml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${pkgdir}/usr/share/doc/tidgi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
	rm -rf "${pkgdir}/usr/share/lintian"

}
