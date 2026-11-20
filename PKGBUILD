# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.29
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
provides=('lolka-x=2.0.29')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.29-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.29/lolka-x-bin-2.0.29-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.29-x86_64.pkg.tar.zst')
sha512sums=('2aa6034089004077aa2c825856b4308e747c7ceb411c8bbac6a702141efd9d2d705225a0b71732adab6825cf8c58b4313c84b13edcc614a86472cd5c26b71faf')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.29-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
