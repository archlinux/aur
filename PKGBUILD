# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.31
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
provides=('lolka-x=2.0.31')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.31-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.31/lolka-x-bin-2.0.31-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.31-x86_64.pkg.tar.zst')
sha512sums=('50050cee341a69d8eb38742e1f5c0fb0b5231b2fc2dbebe3d4b3295ec81ce72a5a971b31254f1093865e645889d8e8a2534bdaaccee12fe623a7344e33ae23ef')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.31-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
