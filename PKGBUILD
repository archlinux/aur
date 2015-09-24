# Contributor: TDY <tdy@gmx.com>
# Contributor: shamrok <szamrok :: gmail.com>
# Contributor: Inigo Serna <inigoserna :: gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=lfm
pkgver=2.3
pkgrel=1
pkgdesc="A powerful file manager for the UNIX console. Based on curses and written in Python."
arch=('any')
url="http://code.google.com/p/lfm/"
license=('GPL3')
depends=('ncurses>=5.0' 'python2>=2.6')
source=("http://lfm.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('a3399306bbd63dd75851e6993fde92fb')
sha1sums=('a751c7e71bb5a3d5442c7696a01348658cde58a6')
sha256sums=('e8df188c17d4d676cf41ccae9f6bf82aa0c5ff3942d5aad985990ad1446c9504')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1s,env python,&2,' lfm/*
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
}

