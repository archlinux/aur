# Author: Dies <JerryCasiano(at)gmail(dot)com>
# Maintainer: Joaquin <joaquingc123 at gmail dot com>
# Contributor: Joeny Ang <ang(dot)joeny(at)gmail(dot)com>
# Contributor: Guan 'kuno' Qing <neokuno(at)gmail(dot)com>
# Contributor: Guten Ye <ywzhaifei(at)gmail(dot)com>
# Contributor: i_magnific0 <i_magnific0(at)yahoo(dot)com>
# Contributor: Pavlo <pavlofreemen(at)gmail(dot)com>
# Contributor: Caleb Maclennan <caleb@alerque.com>

pkgname=font-manager
pkgver=0.7.4.2
_pkgver=${pkgver%\.[0-9]*}
pkgrel=1
pkgdesc="A simple font management application for GTK+ Desktop Environments"
url="http://fontmanager.github.io/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libgee' 'libxml2' 'sqlite' 'gucharmap' 'file-roller')
makedepends=('intltool' 'yelp-tools' 'gobject-introspection' 'vala')
source=("https://github.com/FontManager/master/releases/download/${pkgver}/${pkgname}-${_pkgver}.tar.bz2")
sha256sums=('fea51765fe6e1b50be273d5908b24992a3bb709b1152a5df56870bfee0163ab2')

build() {
  cd ${srcdir}/${pkgname}-${_pkgver}

  ./configure --prefix=/usr --with-file-roller
  make -j1
}

package() {
  cd ${srcdir}/${pkgname}-${_pkgver}

  make DESTDIR=${pkgdir} install
}
