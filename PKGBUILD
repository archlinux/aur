# Maintainer: Filipe Bertelli <filipebertelli@tutanota.com>
# Contributor: hu3rror <hu3rror@protonmail.com>
pkgname=tidgi-bin
_pkgname=tidgi
pkgver=0.7.13
_pkgrel=15
pkgrel=1
pkgdesc="Customizable personal knowledge-base with Github as unlimited storage and blogging platform."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/tiddly-gittly/TidGi-Desktop"
license=('MPL2')
depends=('nodejs' 'alsa-lib' 'atk' 'at-spi2-atk' 'at-spi2-core' 'cairo' 'curl' 'dbus' 'desktop-file-utils' 'expat' 'gdk-pixbuf2' 'glib2' 'gtk3' 'gvfs' 'hicolor-icon-theme' 'libcups' 'libdrm' 'libnotify' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxtst' 'mesa' 'nspr' 'nss' 'openssl' 'pango' 'trash-cli' 'xdg-utils' 'zlib')
makedepends=('zstd')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_i686=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}-${_pkgrel}/${_pkgname}_${pkgver}_amd64.deb")
source_x86_64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}-${_pkgrel}/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://github.com/tiddly-gittly/TidGi-Desktop/releases/download/v${pkgver}-${_pkgrel}/${_pkgname}_${pkgver}_arm64.deb")
sha512sums_i686=('9901964ae81798d00d02c5d03160ff78e83010392b4c2a6defe997eec143a58f3aabc59913c1c8e589084f3272533ffba1bbf9f0874330f9ad287a7db81c9643')
sha512sums_x86_64=('9901964ae81798d00d02c5d03160ff78e83010392b4c2a6defe997eec143a58f3aabc59913c1c8e589084f3272533ffba1bbf9f0874330f9ad287a7db81c9643')
sha512sums_aarch64=('b67a615777647eceed22d1a963939a7d55e5f862bb1a257c6f754adb0d4060a6828db28d84039ec5ffcbdb4bf1cbc2c6db1d65871a38371101806d9b1424e080')


package(){
	# Extract package data
	tar --zstd -xvf data.tar.zst --directory "${pkgdir}"
	cd "${pkgdir}"
	install -D -m644 "usr/lib/tidgi/resources/node_modules/zx/node_modules/yaml/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "usr/share/doc/tidgi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"

}
