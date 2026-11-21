# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.30
pkgrel=1
pkgdesc='Native desktop client for lolka.app - chat and voice with friends'
arch=('x86_64')
url='https://lolka.app'
license=('LicenseRef-LolkaX')
depends=(
  'glibc'
  'gcc-libs'
  'glib2'
  'dbus'
  'fontconfig'
  'krb5'
  'libssl.so=3-64'
  'libpulse'
  'libpipewire'
  'xdg-utils'
  'mesa'
  'libxtst'
  'libxrandr'
  'libxcomposite'
  'libxdamage'
  'xcb-util-cursor'
  'xcb-util-wm'
  'xcb-util-keysyms'
  'libxkbcommon-x11'
  'hicolor-icon-theme'
  'libva'
)
optdepends=(
  'intel-media-driver: hardware video encoding/decoding (VAAPI) on Intel'
  'libva-intel-driver: hardware video encoding/decoding (VAAPI) on Intel up to Haswell'
  'nvidia-utils: hardware video encoding (NVENC) on NVIDIA'
  'gtk3: native GTK dialogs and theme'
)
provides=('lolka-x=2.0.30')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.30-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.30/lolka-x-bin-2.0.30-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.30-x86_64.pkg.tar.zst')
sha512sums=('71ea2a820ab19bd717ecc11cdc871a6b37cccccfba7fa5a8d71a53335fae36af6c3393d7a1b232739928182e6e4d2777f9ae15ed12ffc0dd0a6be007aa6a0c4a')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.30-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
