# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.40
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
provides=('lolka-x=2.0.40')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.40-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.40/lolka-x-bin-2.0.40-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.40-x86_64.pkg.tar.zst')
sha512sums=('d12a8fa6f041cb09e0087205230147612599193ef4cf4d15a2feb2d558d3b82f07fbcef0f57731c0392e5dd6e3ed4be172ce468e1a81b7b1ddafc5de8e07d757')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.40-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
