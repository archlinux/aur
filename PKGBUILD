# Contributor: Ryan Corder <ryanc@greengrey.org>
# Contributor: Lee Burton <lburton@mrow.org>
# Maintainer: Mantas M. <grawity@gmail.com>

pkgname=pam-afs-session
pkgver=2.5
pkgrel=2
pkgdesc="PAM module providing AFS session support"
url="http://www.eyrie.org/~eagle/software/pam-afs-session/"
arch=('i686' 'x86_64')
license=("custom")
depends=('krb5' 'pam')
source=("http://archives.eyrie.org/software/afs/$pkgname-$pkgver.tar.gz"
        "http://archives.eyrie.org/software/afs/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('6b187b6a6efc4a76f651b163108ef8df24262cec9b7f865596ad15551fc48d02'
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
