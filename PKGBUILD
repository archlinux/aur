pkgname=cctv-watcher
pkgver=0.3.2
pkgrel=1
pkgdesc="Application for CCTV cameras monitoring"
url="https://github.com/Junker/cctv-watcher"
arch=('i686' 'x86_64')
license=('GPL-3')
makedepends=('vala' 'meson' 'ninja')
depends=('gtk3' 'libgee' 'gstreamer' 'gst-plugins-base' 'gst-libav' 'gst-plugin-gtk' 'libgudev')
source=("https://github.com/Junker/${pkgname}/archive/${pkgver}.zip")
md5sums=('9e1bfa085faf31c49f3f0ac70a97e59c')

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
