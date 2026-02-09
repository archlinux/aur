# Maintainer: SJMC <launcher@sjmc.club>
# Maintainer: xpe-online <xpecnh2n@gmail.com>
# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=sjmcl-bin
pkgdesc='🌟 A Minecraft launcher from @SJMC-Dev'
pkgver=0.8.2
pkgrel=1
arch=('x86_64' 'aarch64')
license=(GPL-3.0,custom:LICENSE.EXTRA)
url='https://github.com/UNIkeEN/SJMCL'
_baseurl="${url}/releases/download/v${pkgver}"
_source="SJMCL_${pkgver}_linux_${CARCH}.deb"

sha512sums=('5556b520002a8ed21b890e19364b3f9a640eca5e9170a90b70ad7ab519d505fd12d1b2306643b5cf73d56cb0d7530de1a4aa81c6ef165146c6460661bd5114ba')
sha512sums_x86_64=('8c35762773e1897a76317a16bb671be05a0af4f713d85147829fe9e9e58b74827e615736addc4f1c693652635c225af915747ad3a4adf1a6ab494d01b930fdea')
sha512sums_aarch64=('64ba631cfa8c366ab59679a106b441aec4b702598354314ef66dcff4190b1867f4317dd1370c214dcad0cc747ccf442200fc26238ce1056f7488e03f560ca362')

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
