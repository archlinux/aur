# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.18
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
provides=('lolka-x=2.0.18')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.18-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.18/lolka-x-bin-2.0.18-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.18-x86_64.pkg.tar.zst')
sha512sums=('12df69f7db0ee0cfcbb3628bba46892c16a2c02f411134f6aa4bb5744ba1c20346a63755096ce058fb355f63b8cf939fe72155a49b4ebb6db8e8485525697d72')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.18-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
