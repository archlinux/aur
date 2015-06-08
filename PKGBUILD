# Maintainer: Volker Schatz <arch@my-name-without-hyphen.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=mmaker  
pkgver=1.24.2
pkgrel=2 
pkgdesc="MagicPoint Preprocessor"
url="http://www.icir.org/mallman/software/mmaker"
arch=('i686' 'x86_64')
license=('GPL')
depends=('magicpoint' 'perl')
source=(http://www.icir.org/mallman/software/mmaker/$pkgname-$pkgver.tar.gz
        mmaker-resetarea.diff )
md5sums=('e6ed3aa51fce1126994df84c1f24dc22'
         '3f5a84a9e508d88befb225d089ce6d6a')

prepare() {
  cd "$srcdir"
  patch -p0 < mmaker-resetarea.diff
}

package() {
  cd "$srcdir"
  install -Dm755 mmaker "$pkgdir"/usr/bin/mmaker
  install -d "$pkgdir"/usr/share/doc/$pkgname
  cp Example/* RANT README "$pkgdir"/usr/share/doc/$pkgname
  chmod a+r "$pkgdir"/usr/share/doc/$pkgname/*
}

