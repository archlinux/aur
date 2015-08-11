# Contributor: rpj8 (Factory) <semidigerati@gmail.com>
pkgname=charm
pkgver=1.9.2
pkgrel=1
pkgdesc="A full-featured, console-based, cross-platfom blogging client 
for LiveJournal, Atom (Movable Type, Blogger), and MetaWeb (WordPress)."
arch=('any')
url="http://sourceforge.net/projects/ljcharm/"
license=('GPL')
depends=('python2')
optdepends=('python-feedparser: atom API posting')
source=(http://downloads.sourceforge.net/project/ljcharm/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('b67effd5fba0683d79613c853ed352b0')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' charm
  }

  package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" --prefix=/usr
}
