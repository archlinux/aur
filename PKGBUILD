# Maintainer: crimist <aur at crim dot ist>
# Contributor: Sophie Tauchert <sophie@999eagle.moe>

pkgname=gwe
pkgver=0.15.7
pkgrel=1
pkgdesc="A system utility for controlling NVIDIA GPUs"
arch=('any')
url="https://gitlab.com/leinardi/gwe"
license=('GPL3')
depends=('gobject-introspection' 'libdazzle' 'libnotify' 'python' 'python-cairo' 'python-injector' 'python-matplotlib' 'python-peewee' 'python-py3nvml' 'python-gobject' 'python-xlib' 'python-pyxdg' 'python-requests' 'python-reactivex')
makedepends=('meson' 'appstream-glib')
optdepends=('libappindicator-gtk3: tray support')
source=("https://gitlab.com/leinardi/gwe/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('537c13b47ebe1df8940a807f562ac6c50bff19d8b2d85e32542bd0110406f643')

build() {
	arch-meson $pkgname-$pkgver build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
