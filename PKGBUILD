# Maintainer: aksr <aksr at t-com dot me>
pkgname=mailx-git
pkgver=r134.8d4e5b7
pkgrel=1
epoch=
pkgdesc="A small mailx clone, optimized to handle large mbox files."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir/"
url="http://repo.or.cz/w/mailx.git"
license=('custom:BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=('pop3-git: A simple pop3 mail client.' 
            'smtp-git: A simple smtp mail sender.')
checkdepends=()
provides=('')
conflicts=('')
replaces=()
backup=()
options=()
changelog=
install=${pkgname}.install
source=("$pkgname::git://repo.or.cz/mailx.git"
         config.h)
noextract=()
md5sums=('SKIP'
         '7972f21dfbe0d3dcaee90bc217edd389')
sha1sums=('SKIP'
          '0f67056328d0a8542984db302caa4fbc68fc7cc0')
sha256sums=('SKIP'
            '7a6fcea1421ba128941c4f3c8598dbb1285ae84daf3315288e6c891902aae47d')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  cp ../config.h config.h
}

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 mailx  $pkgdir/usr/bin/neatmailx
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

