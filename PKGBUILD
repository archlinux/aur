# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=minmad-git
pkgver=0.r27.e4aed5c
pkgrel=1
epoch=
pkgdesc="A small libmad/oss mp3 player."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/minmad.git"
license=('custom:BSD')
groups=()
depends=('')
makedepends=('git')
optdepends=('oss: sound support')
checkdepends=()
provides=('minmad')
conflicts=('minmad')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git://repo.or.cz/minmad.git"
        "minmad.1")
noextract=()
md5sums=('SKIP'
         '28f040400e36b02e4c5427f0ef22e951')
sha1sums=('SKIP'
          'e72a159f2e4c658d2e401d997f9268b1dca8eb27')
sha256sums=('SKIP'
            'cdc648eb6a35faea3fc1f61adaaa8093fd6b532119b48181d9d58272fad27314')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  make all
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 minmad $pkgdir/usr/bin/minmad
  install -Dm644 ../minmad.1 $pkgdir/usr/share/man/man1/minmad.1
  install -Dm644 README $pkgdir/usr/share/doc/${pkgname%-*}/minmad.1
}

