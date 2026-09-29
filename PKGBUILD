# Maintainer: Lewis Flames <57636993+lewisflames@users.noreply.github.com>
pkgname=spendo-bin
pkgver=0.1.0
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
sha256sums_x86_64=('180ae1d16f070a3831cf938311f62710080d1138e6dcbae5d43ea3f5342d1eb5')

package() {
  bsdtar -xf "$srcdir/Spendo_${pkgver}_amd64.deb" data.tar.gz
  tar -xf data.tar.gz -C "$pkgdir"
}
