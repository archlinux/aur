# Maintainer: VELA <https://github.com/lucannez64/VELA>
pkgname=vela-desktop-bin
pkgver=0.1.157
pkgrel=1
pkgdesc="Passwordless, zero-knowledge vault desktop app (prebuilt binary)"
arch=('x86_64')
url="https://github.com/lucannez64/VELA"
license=('custom')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
         'hicolor-icon-theme' 'libsoup3' 'pango' 'webkit2gtk-4.1'
         'libayatana-appindicator' 'librsvg')
optdepends=('gnome-keyring: system secret-storage backend'
            'keepassxc: alternative secret-storage backend')
provides=('vela-desktop')
conflicts=('vela-desktop')
source_x86_64=("VELA_${pkgver}_amd64.deb::${url}/releases/download/desktop-v${pkgver}/VELA_${pkgver}_amd64.deb")
sha256sums_x86_64=('8020c2bb7d1c50ff0ebb39e7b067a9d25da5a571c2979d17372dd326f4b3d516')

package() {
  ar x "VELA_${pkgver}_amd64.deb"
  tar -xf data.tar.* -C "${pkgdir}"
}
