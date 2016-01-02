# Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: shamrok <szamrok :: gmail.com>
# Contributor: Inigo Serna <inigoserna :: gmail.com>
# Contributor: aksr <aksr at t-com dot me>
pkgname=lfm
pkgver=3.0
pkgrel=2
pkgdesc="A powerful file manager for the UNIX console. Based on curses and written in Python."
arch=('any')
url="https://inigo.katxi.org/devel/lfm/"
license=('GPL3')
depends=('ncurses' 'python')
source=("https://inigo.katxi.org/devel/lfm/$pkgname-$pkgver.tar.gz")
md5sums=('9c13c5fafcb1aecd43f51fa9b0278000')
sha1sums=('a7ef8503c1a9b054ad64c2327173a02eb741389c')
sha256sums=('dcb9c3dc3122ed41bfb72ed2f03e41afa917d17b23ee8459371e7f39e9b888e7')

# In order to prevent curl warning.
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir"
}

