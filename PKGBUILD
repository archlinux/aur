#! /bin/bash
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Johan Slikkie <johan@slikkie.nl>
# Maintainer: jorge_barroso <jorge.barroso.11@gmail.com> 

pkgname=abraca
pkgver=0.7.1
_fullpkgver=0.7.1-107-g1dbef52
pkgrel=5
pkgdesc="A GTK3 client for the XMMS2 music player, with a focus on collections"
arch=('x86_64' 'i686')
url="http://abraca.github.com/Abraca/"
license=('GPL')
depends=('gtk3' 'xmms2' 'libgee' 'hicolor-icon-theme')
makedepends=('scons' 'vala>=0.18.0' 'python2' 'gettext')
install=abraca.install
sha512sums=('793b505e8657ffd18bff6b9f5ae22353417833cb3b79a95570be1aea7caf07e8cd54042b5edc6c2a0d04bc72063372e2e3e3edda3bdf44eb28a92a426f4a5726')
source=(https://github.com/$pkgname/$pkgname/tarball/master)

build() {
 
  cd "$srcdir"/*
  
  ./waf configure --prefix=/usr
  ./waf build
}

package() {
  ./waf install
}

# vim:set ts=2 sw=2 et:
