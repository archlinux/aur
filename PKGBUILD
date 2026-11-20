# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.24
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
provides=('lolka-x=2.0.24')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.24-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.24/lolka-x-bin-2.0.24-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.24-x86_64.pkg.tar.zst')
sha512sums=('3f71bee4914b3e61909e2ab58d576d2dd8bb4bedc81a8db0546b2e24ff1588a87db31d669767f47ac26a5fd49dce4ece3d7746c2c2a70dc620cf0a857988858d')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.24-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
