# Maintainer: SJMC <launcher@sjmc.club>
# Maintainer: xpe-online <xpecnh2n@gmail.com>
# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=sjmcl-bin
pkgdesc='🌟 A Minecraft launcher from @SJMC-Dev'
pkgver=1.3.0
_github_pkgver=1.3.0
pkgrel=1
arch=('x86_64' 'aarch64')
license=(GPL-3.0,custom:LICENSE.EXTRA)
url='https://github.com/UNIkeEN/SJMCL'
_baseurl="${url}/releases/download/v${_github_pkgver}"
_source="SJMCL_${_github_pkgver}_linux_${CARCH}.deb"

sha256sums=('a27ac3ee7cfc8a2956505d781d77695a179ffdbced5933779447b7022388ba6a')
sha256sums_x86_64=('be821b5dd0c7b12ae9dd18c60fef9a976c5f2cc1eed30ac3c64698ba4cd1c3d1')
sha256sums_aarch64=('f759a550b804b86f8d32023c6ee71a7747d92fcef9eff65748173cffc6089bff')

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
