# Maintainer: Lolka LLC <support@lolka.app>
# Contributor: Mikhail Velichko <efklid@gmail.com>

pkgname=lolka-x-bin
pkgver=2.0.38
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
provides=('lolka-x=2.0.38')
conflicts=('lolka-x')
options=('!strip' '!debug')
source=('lolka-x-2.0.38-x86_64.pkg.tar.zst::https://cdn.lolka.app/desktop/linux/2.0.38/lolka-x-bin-2.0.38-1-x86_64.pkg.tar.zst')
noextract=('lolka-x-2.0.38-x86_64.pkg.tar.zst')
sha512sums=('3b2f9c1c3912a1b52546a05ad70947aa6728a34a7174be96b983642dc30eec60ea2da6308933350a6a99711c2b83a46aa114e0d7970b014dc13984d9e7abb42c')

package() {
  bsdtar -xpf "${srcdir}/lolka-x-2.0.38-x86_64.pkg.tar.zst" -C "${pkgdir}" \
    --exclude='.BUILDINFO' --exclude='.MTREE' --exclude='.PKGINFO' --exclude='.INSTALL' --exclude='.CHANGELOG'
}
