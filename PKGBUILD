# Contributor: Ryan Corder <ryanc@greengrey.org>
# Contributor: Lee Burton <lburton@mrow.org>
# Maintainer: Mantas M. <grawity@gmail.com>

pkgname=pam-afs-session
pkgver=2.6
pkgrel=1
pkgdesc="PAM module providing AFS session support"
url="https://www.eyrie.org/~eagle/software/pam-afs-session/"
arch=('i686' 'x86_64')
license=("custom")
depends=('krb5' 'pam')
source=("https://archives.eyrie.org/software/afs/$pkgname-$pkgver.tar.gz"
        "https://archives.eyrie.org/software/afs/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('bf6c2a60a079ec53917d268a97d030735e6189fb56900d35c6f6b0191b5dfcc5'
            'SKIP')
validpgpkeys=('E784364E8DDE7BB370FBD9EAD15D313882004173')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2:sw=2:et:ft=sh
