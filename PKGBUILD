# Maintainer: robertfoster

pkgname=whatweb-git
pkgver=4245.5aa3d5e4
pkgrel=1
pkgdesc="Next generation web scanner that identifies what websites are running."
arch=('i686' 'x86_64')
replaces=('whatweb')
conflicts=('whatweb')
provides=('whatweb')
url="http://www.morningstarsecurity.com/research/whatweb"
license=('GPL')
depends=('ruby1.8')
source=("whatweb::git://github.com/urbanadventurer/WhatWeb.git")

package() {
  cd whatweb
  sed -i 's/TODO //g' Makefile
  make DESTDIR=$pkgdir install
  sed 's#/usr/bin/env ruby#/usr/bin/ruby-1.8#g' -i ${pkgdir}/usr/bin/whatweb

}

pkgver() {
  cd whatweb
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
