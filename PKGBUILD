pkgname=scrypt-kdf-git
pkgrel=1
pkgver=79
pkgdesc='library and command-line utility for the scrypt key derivation function'
arch=(i686 x86_64)
license=(bsd gpl3+)
makedepends=(git gcc)
provides=(scrypt-kdf)
depends=()
conflicts=(libscrypt)
source=("$pkgname::git://github.com/jkalbhenn/scrypt")
url=https://github.com/jkalbhenn/scrypt
md5sums=(SKIP)

pkgver() {
  cd $pkgname
  git rev-list --count HEAD
}

build() {
  cd $pkgname
  ./exe/compile
}

package() {
  cd $pkgname
  ./exe/install "$pkgdir"
}
