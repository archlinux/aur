# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.20
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
provides=('lolka-x=2.0.20')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.20-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.20/lolka-x-bin-2.0.20-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.20-x86_64.pkg.tar.zst')
sha512sums=('d32dbed4fd460f7bc78d73324197f1dffeea2803d41517d390a16e4cf330fa8a19ac1f00e4e53da76ef1ea5a827333c495c9c5e238e1c61fd42013fe08a02e17')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.20-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
