pkgname=lig
pkgver=r139.g2680249
pkgrel=1
pkgdesc="LISP Internet Groper, a tool that can be used to query the LISP Map-Server database"
url="https://github.com/LISPmob/lig-lispmob"
arch=('x86_64' 'i686' 'armv6h')
license=('BSD-3-clause')
depends=('openssl')
makedepends=('git')
_commit=268024993fa6e8864085676222b9490022ce928c
source=("git+https://github.com/LISPmob/lig-lispmob#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd lig-lispmob
  #git describe | sed 's/^v//; s/-/.r/; s/-/./'
  echo "r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd lig-lispmob
  make
}

package() {
  cd lig-lispmob
  install -Dm755 lig "$pkgdir"/usr/bin/lig
  install -Dm644 lig.1 "$pkgdir"/usr/share/man/man1/lig.1
}

# vim:set ts=2 sw=2 et:
