# Maintainer: SJMC <launcher@sjmc.club>
# Maintainer: xpe-online <xpecnh2n@gmail.com>
# Maintainer: raindropqwq <raindropqwq@outlook.com>

pkgname=sjmcl-bin
pkgdesc='🌟 A Minecraft launcher from @SJMC-Dev'
pkgver=0.6.5
pkgrel=1
arch=(x86_64)
license=(GPL-3.0,custom:LICENSE.EXTRA)
url='https://github.com/UNIkeEN/SJMCL'
source=("https://github.com/UNIkeEN/SJMCL/releases/download/v${pkgver}/SJMCL_${pkgver}_linux_x86_64.deb"
        'LICENSE.EXTRA')
sha512sums=('ec387d5cbf13af91a5110a82e204cd9936e4d5e54fca8a9a6ec0beaf57862d158bfeb6089b147523528fa3bcdb7e20ed8678ae108ec79a185e1fb9f63bb5d75f'
            '5556b520002a8ed21b890e19364b3f9a640eca5e9170a90b70ad7ab519d505fd12d1b2306643b5cf73d56cb0d7530de1a4aa81c6ef165146c6460661bd5114ba')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!emptydirs')
provides=('sjmcl')
conflicts=('sjmcl')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}"
  chmod +x ${pkgdir}/usr/bin/SJMCL
  install -Dm 644 "${srcdir}/LICENSE.EXTRA" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.EXTRA"
}
