_pkgname=BozoCrack
pkgname=bozocrack-git
pkgver=20130417
pkgrel=1
pkgdesc="A silly & effective MD5 cracker using Google Search"
arch=(any)
url="https://github.com/juuso/BozoCrack"
license=(Public Domain)
depends=("ruby")
source=("git+https://github.com/juuso/BozoCrack.git")
md5sums=("SKIP")

pkgver() {
  cd "$srcdir/$_pkgname"
  git log -1 --format='%cd' --date=short | tr -d -- '-'
}

package() {
  install -D "$srcdir/$_pkgname/bozocrack.rb" "$pkgdir/usr/bin/bozocrack"
}
