# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

_pkgname=itop
pkgname=$_pkgname-git
pkgver=0.1.9.g6dbb3c4
pkgrel=2
pkgdesc="Interrupts 'top-like' utility for Linux"
arch=('any')
url="https://github.com/kargig/itop"
license=('custom')
depends=('perl')
makedepends=('git')
conlicts=('itop')
source="git+https://github.com/kargig/itop.git"
#source=("git://github.com/kargig/$pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g" | sed "1s/v//"
}

package() {
  install -Dm755 "$srcdir/itop/itop" "$pkgdir/usr/bin/itop"
  install -Dm644 "$srcdir/itop/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 "$srcdir/itop/README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
