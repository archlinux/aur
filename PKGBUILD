# Maintainer: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: uvok <uvok at online dot de>
# Contributor: Urist <9362773 at gmail.com>

pkgname=bti
pkgver=032
pkgrel=2
pkgdesc='Console client for Twitter and identi.ca'
arch=('i686' 'x86_64')
url='http://gregkh.github.com/bti/'
license=('GPL')
depends=('pcre' 'libxml2' 'curl' 'liboauth')
makedepends=('git')

build() {
  local _gitroot='git://github.com/gregkh/bti.git'
  git clone ${_gitroot}

  cd bti
  git checkout ${pkgver}

  ./autogen.sh

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd bti
  
  make DESTDIR=${pkgdir} install
}
