# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.36
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
provides=('lolka-x=2.0.36')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.36-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.36/lolka-x-bin-2.0.36-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.36-x86_64.pkg.tar.zst')
sha512sums=('d5a6b281a2cd626070f87d1bbed9e2d37e4b24865619645a45f43c8d99ec14ada824174dd77ebbce16b8bf84a24c663e4bb8a018ba3a85fc7793aa7c7cc7652f')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.36-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
