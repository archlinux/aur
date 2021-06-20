# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Haoyu Bai <baihaoyu@gmail.com>

pkgname=umit
pkgver=1.0
pkgrel=2
pkgdesc="A powerful nmap frontend."
arch=('i686' 'x86_64' 'ppc')
url="https://sourceforge.net/projects/umit/"
license=('GPL')
depends=('python2' 'pygtk' 'nmap' 'python2-pysqlite')
makedepends=('python2')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2"
        'setup.patch')
md5sums=('68412d8d50dafd53e0392f71ed62dcfc'
         'a1e1b57443c92e716b881bdb347fe091')

prepare() {
  cd "$srcdir"/$pkgname-$pkgver
  patch -p0 < "$srcdir"/setup.patch
} 

build() {
  cd "$srcdir"/$pkgname-$pkgver
    python2 setup.py build
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build --install-lib=usr/share/umit
}