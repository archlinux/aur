pkgname=cctv-watcher
pkgver=0.1.0
pkgrel=2
pkgdesc="Application for CCTV cameras monitoring"
url="https://github.com/Junker/cctv-watcher"
arch=('i686' 'x86_64')
license=('GPL-3')
makedepends=('vala' 'meson' 'ninja')
depends=('gtk3' 'libgee' 'gstreamer' 'gst-plugins-base' 'gst-libav' 'gst-plugin-gtk')
source=("https://github.com/Junker/${pkgname}/archive/${pkgver}.zip")
md5sums=('4f7c85be8ef725bb149e98836c35b3cf')

build() {
cd $srcdir/${pkgname}-$pkgver
meson build --prefix=/usr
cd build
ninja
}

package() {
cd $srcdir/${pkgname}-$pkgver/build
DESTDIR="$pkgdir" ninja install
}
