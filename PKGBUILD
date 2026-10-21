# Maintainer: Lewis Flames <57636993+lewisflames@users.noreply.github.com>
pkgname=spendo-bin
pkgver=0.2.0
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
sha256sums_x86_64=('732df6a05ef373ab2875d86ad0405a021e35d87c125b8a730e56cde85d82c010')

package() {
  bsdtar -xf "$srcdir/Spendo_${pkgver}_amd64.deb" data.tar.gz
  tar -xf data.tar.gz -C "$pkgdir"
}
