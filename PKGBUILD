# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.26
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
provides=('lolka-x=2.0.26')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.26-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.26/lolka-x-bin-2.0.26-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.26-x86_64.pkg.tar.zst')
sha512sums=('3bfceb30f8aa8001e9056ea577f4cd03d1b97db77d3c4d9a5bfa5dddd7ce3f88d8eaa61849c4c7f8bcffa24a6601b4979ed6e7d0aaac871806f456a511c6092e')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.26-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
