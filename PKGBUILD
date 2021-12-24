# Maintainer: Hiromon <iamhirotokun@gmail.com>

pkgname=zorin-appgrid-lite
pkgver=1.0.2
_ver="_$pkgver"
pkgrel=1
epoch=0
pkgdesc="Zorin AppGrid Lite from Zorin OS"
arch=('any')
url="https://zorin.com/os/"
license=('GPL2')
depends=('libgee>=0.18.0' 'gnome-menus>=3.13.0' 'glib2>=2.50.0' 'gtk3>=3.22.0' 'libwnck3>=3.20.0')
makedepends=('meson' 'ninja' 'vala')
provides=('zorin-appgrid-lite')
conflicts=('zorin-appgrid-lite')
source=("http://ppa.launchpad.net/zorinos/stable/ubuntu/pool/main/z/zorin-appgrid-lite/$pkgname$_ver.tar.xz")
sha1sums=('94c3d572b7f02bb8646aa1cbbd75425223ef6c1e')
sha256sums=('af283469b3f7add2ba5e925d50ce3bf98cb7c4c0b0a7ad9e1ec761c3979eab09')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
