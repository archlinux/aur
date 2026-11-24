# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.37
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
provides=('lolka-x=2.0.37')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.37-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.37/lolka-x-bin-2.0.37-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.37-x86_64.pkg.tar.zst')
sha512sums=('dc06de57a1b8963f3b4b93e8255a92c39405abf573c227d7830336b65cecd77fc1bab99f27ee190b402a8ec1bbd22d1e5bcd314011b9e0d7bdd19605a13dcdde')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.37-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
