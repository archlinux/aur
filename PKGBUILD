# Maintainer: VELA <https://github.com/lucannez64/VELA>
pkgname=vela-desktop-bin
pkgver=0.1.516
pkgrel=1
pkgdesc="Passwordless, zero-knowledge vault desktop app (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lucannez64/VELA"
license=('custom')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
         'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1'
         'libayatana-appindicator' 'librsvg')
optdepends=('gnome-keyring: system secret-storage backend'
            'keepassxc: alternative secret-storage backend'
            'fprintd: fingerprint unlock and fill confirmation')
provides=('vela-desktop')
conflicts=('vela-desktop')
# Prebuilt binary: upstream already stripped it — re-stripping is
# useless and the split -debug package would only contain junk.
options=('!strip' '!debug')
source_x86_64=("VELA_${pkgver}_amd64.deb::${url}/releases/download/desktop-v${pkgver}/VELA_${pkgver}_amd64.deb")
sha256sums_x86_64=('213d215a4e300a02bf06aee520febf9a8c6e305a79403f991efa101cb39ba58e')

package() {
  ar x "VELA_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "${pkgdir}"
}
