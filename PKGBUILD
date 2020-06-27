# Maintainer: Elliot <CheeseEBoi@mailo.com>

pkgname=xfce-theme-greybird-geeko
pkgver=3.22.11
pkgrel=1
pkgdesc="OpenSUSE's Modified 'Desktop Suite for Xfce"
arch=('any')
url="https://shimmerproject.org"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk3')
makedepends=('librsvg' 'meson' 'ruby-sass' 'sassc')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
            'lightdm-gtk-greeter: required for the LightDM GTK theme'
            'shimmer-wallpapers: contains the Greybird wallpaper, among others'
            'lib32-gtk-engine-murrine: required for multilib')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird-Geeko/archive/v$pkgver.tar.gz")
sha256sums=('3c71ae4377cc86d16093fb7d796b2762f869d8b6d2281649ea41b4aaab595cf9')

build() {
	arch-meson "Greybird-Geeko-$pkgver" build
	ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
