pkgname=cctv-watcher
pkgver=0.1.1
pkgrel=1
pkgdesc="Application for CCTV cameras monitoring"
url="https://github.com/Junker/cctv-watcher"
arch=('i686' 'x86_64')
license=('GPL-3')
makedepends=('vala' 'meson' 'ninja')
depends=('gtk3' 'libgee' 'gstreamer' 'gst-plugins-base' 'gst-libav' 'gst-plugin-gtk')
source=("https://github.com/Junker/${pkgname}/archive/${pkgver}.zip")
md5sums=('1a5313835b2798274195ebb5b1e5b930')

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
