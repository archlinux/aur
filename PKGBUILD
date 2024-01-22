# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor: Bjoern Franke <bjo at nord-west.org>
# Contributor: flan_suse
pkgname=xfce-theme-greybird
pkgver=3.23.3
pkgrel=1
pkgdesc="Desktop Suite for Xfce"
arch=('any')
url="https://shimmerproject.org"
license=('CC-BY-SA-3.0 AND GPL-2.0-or-later')
makedepends=('librsvg' 'meson' 'sassc')
optdepends=('elementary-xfce-icons: matching icon set; use the dark icon theme'
            'gtk3: required for CSS/GTK3 theme'
            'lightdm-gtk-greeter: required for the LightDM GTK theme'
            'shimmer-wallpapers: contains the Greybird wallpaper, among others'
            'gtk-engine-murrine: GTK2 theme support')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/shimmerproject/Greybird/archive/v$pkgver.tar.gz")
sha256sums=('2c97d3a7281c80f5752294f196bff22a814aef8da7ca3b7545f50bbb9ed16d64')

build() {
  arch-meson "Greybird-$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  cd "Greybird-$pkgver"
  install -Dm644 LICENSE.CC -t "$pkgdir/usr/share/licenses/$pkgname"
}
