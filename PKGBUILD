# Maintainer: pingod
# Upstream LICENSE (custom, non-SPDX): https://github.com/GuqiGG/Bili-Space/blob/master/LICENSE

pkgname=bili-space-bin
pkgver=0.1.71
pkgrel=1
pkgdesc="Bilibili desktop client with native GTK and isolated account profiles (official Linux build)"
arch=('x86_64')
url="https://github.com/GuqiGG/Bili-Space"
license=('custom')
depends=(
  'python' 'python-gobject' 'python-cairo'
  'gtk3' 'webkit2gtk-4.1'
  'gstreamer' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad'
  'gst-plugins-ugly' 'gst-libav'
)
provides=('bili-space')
conflicts=('bili-space')
source=(
  "Bili-Space-${pkgver}-linux.deb::https://github.com/GuqiGG/Bili-Space/releases/download/v${pkgver}/Bili-Space-${pkgver}-linux.deb"
)
sha256sums=(
  '7e4dd7720e0353e63164956fc4e1a260d98c004fe480178f761de79621f81307'
)
options=('!strip')

package() {
  cd "$srcdir"
  ar x "Bili-Space-${pkgver}-linux.deb" data.tar.zst
  bsdtar -xf data.tar.zst -C "$pkgdir"
}
