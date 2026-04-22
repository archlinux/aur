# Maintainer: SJMC <launcher@sjmc.club>
# Maintainer: xpe-online <xpecnh2n@gmail.com>
# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=sjmcl-bin
pkgdesc='🌟 A Minecraft launcher from @SJMC-Dev'
pkgver=1.0.0beta.6
_github_pkgver=1.0.0-beta.6
pkgrel=1
arch=('x86_64' 'aarch64')
license=(GPL-3.0,custom:LICENSE.EXTRA)
url='https://github.com/UNIkeEN/SJMCL'
_baseurl="${url}/releases/download/v${_github_pkgver}"
_source="SJMCL_${_github_pkgver}_linux_${CARCH}.deb"

sha512sums=('5556b520002a8ed21b890e19364b3f9a640eca5e9170a90b70ad7ab519d505fd12d1b2306643b5cf73d56cb0d7530de1a4aa81c6ef165146c6460661bd5114ba')
sha512sums_x86_64=('5f4181afd62e5609d35c7cb303be1113a5f131e28d4f3e624d797f68d51330e97e5c6500bb612a3dfe1ce537dccb18b8d1e108eb7e3d6344e6dceca9242177f6')
sha512sums_aarch64=('4322ca644a3c902fae0d034c9aa9ec17dad53384da960450a370a39c22e467c8aec5e8b77a39691b58a205332a118dde66da1508b842a48cd47d846f99f90f6d')

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
