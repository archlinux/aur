# Maintainer: Joaquin <joaquingc123 at gmail dot com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Dies <JerryCasiano(at)gmail(dot)com>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Guan 'kuno' Qing <neokuno(at)gmail(dot)com>
# Contributor: Guten Ye <ywzhaifei(at)gmail(dot)com>
# Contributor: i_magnific0 <i_magnific0(at)yahoo(dot)com>
# Contributor: Pavlo <pavlofreemen(at)gmail(dot)com>

pkgname=font-manager
pkgver=0.7.9
pkgrel=2
pkgdesc='A simple font management application for GTK+ Desktop Environments'
url='https://fontmanager.github.io'
arch=('x86_64' 'i686')
license=('GPL')
depends=('libxml2' 'sqlite' 'json-glib' 'gtk3')
optdepends=('file-roller')
makedepends=('intltool' 'yelp-tools' 'gobject-introspection' 'vala' 'meson' 'ninja' 'libxml2')
source=("https://github.com/FontManager/master/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('654ed997ffb4671ba943a7d76ccdf305a20aa46f12c65845604211c16bde36da')

build() {
    cd "$pkgname-$pkgver"
    meson --prefix /usr --buildtype=release build_dir
    ninja -v -C build_dir
}

package() {
    cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" ninja -C build_dir install
}
