pkgname=cctv-watcher
pkgver=0.2.0
pkgrel=1
pkgdesc="Application for CCTV cameras monitoring"
url="https://github.com/Junker/cctv-watcher"
arch=('i686' 'x86_64')
license=('GPL-3')
makedepends=('vala' 'meson' 'ninja')
depends=('gtk3' 'libgee' 'gstreamer' 'gst-plugins-base' 'gst-libav' 'gst-plugin-gtk' 'libgudev')
source=("https://github.com/Junker/${pkgname}/archive/${pkgver}.zip")
md5sums=('7c59462685f78d848ba2f7e3d790f2d2')

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
