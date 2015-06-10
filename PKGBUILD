# Maintainer: Thomas Dziedzic < gostrc at gmail >

pkgname=re2-hg
pkgver=1
pkgrel=1
pkgdesc='Fast, safe and thread-friendly alternative to backtracking regular expression engines'
arch=('i686' 'x86_64')
url='http://code.google.com/p/re2/'
license=('GPL2')
provides=('re2')
makedepends=('mercurial')

build() { 
  rm -rf re2
  hg clone https://re2.googlecode.com/hg re2

  cd re2

  sed -i 's_prefix=/usr/local_prefix=/usr_' Makefile

  make
}

package() {
  cd re2

  make DESTDIR=${pkgdir} install
}
