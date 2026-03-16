# Maintainer: SJMC <launcher@sjmc.club>
# Maintainer: xpe-online <xpecnh2n@gmail.com>
# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=sjmcl-bin
pkgdesc='🌟 A Minecraft launcher from @SJMC-Dev'
pkgver=1.0.0beta.2
_github_pkgver=1.0.0-beta.2
pkgrel=1
arch=('x86_64' 'aarch64')
license=(GPL-3.0,custom:LICENSE.EXTRA)
url='https://github.com/UNIkeEN/SJMCL'
_baseurl="${url}/releases/download/v${_github_pkgver}"
_source="SJMCL_${_github_pkgver}_linux_${CARCH}.deb"

sha512sums=('5556b520002a8ed21b890e19364b3f9a640eca5e9170a90b70ad7ab519d505fd12d1b2306643b5cf73d56cb0d7530de1a4aa81c6ef165146c6460661bd5114ba')
sha512sums_x86_64=('b3081152cebb57fb458c8cab343949eb1380ab3e66aa8c436f01ce931d239bcb0c482f28c066bc8495afb40079953d7e92f67902a82c1840315edef152839437')
sha512sums_aarch64=('5ec287caa12a9427e46f7dcc77e9f3e27a2dbea0cb6174d9d46e9e810fc63b9ebbdedd8c385338303648bd7469be8f98ddd3f64b579d819ecaa82ec695c8757a')

source=('LICENSE.EXTRA')
source_x86_64=("${_baseurl}/${_source}")
source_aarch64=("${_baseurl}/${_source}")
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
provides=('sjmcl')
conflicts=('sjmcl')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  chmod +x ${pkgdir}/usr/bin/SJMCL
  install -Dm 644 "${srcdir}/LICENSE.EXTRA" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.EXTRA"
}
