# Author: Dies <JerryCasiano(at)gmail(dot)com>
# Maintainer: Joaquin <joaquingc123 at gmail dot com>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Guan 'kuno' Qing <neokuno(at)gmail(dot)com>
# Contributor: Guten Ye <ywzhaifei(at)gmail(dot)com>
# Contributor: i_magnific0 <i_magnific0(at)yahoo(dot)com>
# Contributor: Pavlo <pavlofreemen(at)gmail(dot)com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=font-manager
pkgver=0.7.5
pkgrel=2

pkgdesc="A simple font management application for GTK+ Desktop Environments"
url="http://fontmanager.github.io/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'sqlite')
optdepends=('file-roller')
makedepends=('intltool' 'yelp-tools' 'gobject-introspection' 'vala' 'meson' 'ninja')
source=("https://github.com/FontManager/master/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('9795212bdbf765e48662b2e8cb20bd232384c96f15a4c21dbc37643b2319cb30')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  meson --prefix /usr --buildtype=debugoptimized build_dir
  ninja -v -C build_dir
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  DESTDIR="${pkgdir}" ninja -C build_dir install
}
