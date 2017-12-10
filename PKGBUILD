# Maintainer: robertfoster

pkgname=whatweb
pkgver=0.4.9
pkgrel=1
pkgdesc="Next generation web scanner that identifies what websites are running."
arch=('i686' 'x86_64')
url="http://www.morningstarsecurity.com/research/whatweb"
license=('GPL')
depends=('ruby1.8')
conflicts=('whatweb-git')
source=("https://github.com/urbanadventurer/WhatWeb/archive/v$pkgver.tar.gz")

package() {
  cd "$srcdir/WhatWeb-$pkgver"
  make DESTDIR=$pkgdir
  sed 's#/usr/bin/env ruby#/usr/bin/ruby-1.8#g' -i ${pkgdir}/usr/bin/whatweb
}

md5sums=('31d57457f34f6691ac20639ffdef8ad6')
