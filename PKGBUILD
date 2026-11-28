# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.39
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
provides=('lolka-x=2.0.39')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.39-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.39/lolka-x-bin-2.0.39-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.39-x86_64.pkg.tar.zst')
sha512sums=('e3f91791569a7f7ef8ddf579d61014e53e656c3a39f4db1a149ffa153c50a7662834f62b13124fa20ec104e59b44bb3590b687ffe8ab6453d261bf1ed64e9d44')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.39-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
