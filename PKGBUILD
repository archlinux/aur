#! /bin/bash
# Contributor: Jorge Barroso <jorge.barroso.11 at gmail dot com>
# Contributor: Javier 'Phrodo_00' Aravena <phrodo.00@gmail.com>

pkgname=affinity
pkgver=0.1
pkgrel=6
pkgdesc="Affinity is a desktop search tool which provides a front-end to various desktop information"
url="http://code.google.com/p/affinity-search/"
arch=('any')
license=('GPL')
depends=('orbit2' 'gnome-vfs' 'gnome-desktop2' 'gtk2' 'cairo' 'gconf-gtk2' 'gnome-libs') # needs gnome-libs 1.x!
# gnome-libs 1.4.2 is the last version, from 2002:
# https://download.gnome.org/sources/gnome-libs/1.4/?C=M&O=D
# https://archive.ph/BO1Pa (from https://www.linuxfromscratch.org/blfs/view/5.1/gnome/gnome-libs.html )
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/affinity-search/affinity-${pkgver}.tar.gz")
sha512sums=('39b4627b0e3ce391da7838b78c6e7c10859e4b54dc8f045e5103209c20b8ce5331e2c24ac5d0ccfed849429bef51bb2c7821108b60a249c44e0108e022b94249')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}

package(){
  make DESTDIR=$startdir/pkg install
}

