# Maintainer: MotoTunePro USA LLC <support@mototunepro.com>
pkgname=mototunepro
pkgver=2.1.1+24
pkgrel=1
pkgdesc='Diagnostics and tuning for supported Buell motorcycles'
arch=('x86_64')
url='https://mototunepro.com/'
license=('LicenseRef-Proprietary' 'LGPL-3.0-or-later')
depends=('at-spi2-core' 'bluez-libs' 'cairo' 'fontconfig' 'gdk-pixbuf2'
         'glib2' 'glibc' 'gtk3' 'harfbuzz' 'hicolor-icon-theme' 'libepoxy' 'libgcc' 'libglvnd' 'libsecret'
         'libstdc++' 'pango' 'xdg-utils' 'zlib')
optdepends=('bluez: Bluetooth connectivity' 'gnome-keyring: Secret Service provider')
# Keep the vendor Flutter bundle intact.
options=('!strip' '!debug')
source_x86_64=("https://packages.mototunepro.com/linux/releases/${pkgver}/mototunepro-${pkgver}-linux-x86_64.tar.xz")
sha256sums_x86_64=('785d1cc87db0ac8c6d7d3b68fb9d90ed2d2c09a7c6aedcab2006e84d7ac10920')

package() {
  cp -a --no-preserve=ownership -- "${srcdir}/mototunepro-${pkgver}-linux-${CARCH}/usr" "${pkgdir}/usr"
  install -Dm644 "${pkgdir}/usr/share/doc/mototunepro/copyright" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
