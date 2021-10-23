# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: rpj8 (Factory) <semidigerati@gmail.com>
pkgname=charm
pkgver=1.9.2
pkgrel=3
pkgdesc="A full-featured, console-based, cross-platfom blogging client 
for LiveJournal, Atom (Movable Type, Blogger), and MetaWeb (WordPress)."
arch=('any')
url="https://sourceforge.net/projects/ljcharm/"
license=('GPL')
depends=('python2')
source=(https://downloads.sourceforge.net/project/ljcharm/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('b67effd5fba0683d79613c853ed352b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' charm
  sed -i 's/== \"UTF8\"/== \"UTF-8\"/' ljcharm.py
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
}