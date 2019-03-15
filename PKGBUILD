# Author: Dies <JerryCasiano(at)gmail(dot)com>
# Maintainer: Joaquin <joaquingc123 at gmail dot com>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Guan 'kuno' Qing <neokuno(at)gmail(dot)com>
# Contributor: Guten Ye <ywzhaifei(at)gmail(dot)com>
# Contributor: i_magnific0 <i_magnific0(at)yahoo(dot)com>
# Contributor: Pavlo <pavlofreemen(at)gmail(dot)com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=font-manager
pkgver=0.7.4.3
pkgrel=2
pkgdesc="A simple font management application for GTK+ Desktop Environments"
url="http://fontmanager.github.io/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libxml2' 'sqlite')
optdepends=('file-roller')
makedepends=('yelp-tools' 'gobject-introspection' 'vala')
source=("https://github.com/FontManager/master/releases/download/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('39bb00942b89eeabb96946cc0c0db5e7ecfe8d62805d87f0115de49ee02487b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-file-roller
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}
