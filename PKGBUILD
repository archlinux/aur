# Maintainer: Sebastian Neef <aur AT gehaxelt DOT IN>
pkgbase=useragent-git
pkgname=useragent-git
pkgver=r5.24fcd99
pkgrel=1
pkgdesc="Tool to print different useragents. Useful for curl or wget."
arch=('any')
url="https://github.com/gehaxelt/SH-UserAgent"
license=('unknown')
depends=('bash')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+https://github.com/gehaxelt/SH-UserAgent.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  ( set -o pipefail
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin"
	mv useragent.sh "$pkgdir/usr/bin/useragent"
	chmod +x "$pkgdir/usr/bin/useragent"
}
