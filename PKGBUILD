# Maintainer: Lewis Flames <57636993+lewisflames@users.noreply.github.com>
pkgname=spendo-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Local-first personal finance manager'
arch=('x86_64')
url='https://github.com/lewisflames/spendo'
license=('MIT')
depends=(
  'cairo'
  'desktop-file-utils'
  'gdk-pixbuf2'
  'glib2'
  'gtk3'
  'hicolor-icon-theme'
  'webkit2gtk-4.1'
)
provides=('spendo')
conflicts=('spendo')
options=('!strip' '!debug')
install=spendo-bin.install
source_x86_64=("${url}/releases/download/v${pkgver}/Spendo_${pkgver}_amd64.deb")
sha256sums_x86_64=('7b4cb302bdb860f81c7164216d32efee4fd218fc9ac67130595e88bbf594c1a6')

package() {
  bsdtar -xf "$srcdir/Spendo_${pkgver}_amd64.deb" data.tar.gz
  tar -xf data.tar.gz -C "$pkgdir"
}
