# Maintainer: Masanori Ogino <masanori.ogino@gmail.com>
# Contributor: perlawk
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=siod
pkgver=3.6.2
pkgrel=1
pkgdesc="Scheme in one day or scheme in one defun"
arch=('i686' 'x86_64')
url="http://people.delphiforums.com/gjc/siod.html"
license=('LGPL')
depends=('gd')
source=('git+https://github.com/ludwhe/siod'
        'use-rpath.patch')
sha256sums=('SKIP'
            '2babd5b14db11d48b70ef07c22d7df0f4b3aca7978b5da7fc7f947b16b80a3df')

build() {
  cd "$srcdir/siod"
  patch --forward --strip=1 --input="${srcdir}/use-rpath.patch"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/siod"
  make install PREFIX=$pkgdir/usr
}

