# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.25
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
provides=('lolka-x=2.0.25')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.25-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.25/lolka-x-bin-2.0.25-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.25-x86_64.pkg.tar.zst')
sha512sums=('ca6f73dfcd38e44630b0344fa62ea6a94001919212ed8f8075012430e5e6c3822d408d0b9ee0b6f8acfdd21e122b953fed99eee616904b7a5d7ae463d622b779')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.25-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
