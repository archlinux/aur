# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=aconfmgr-git
pkgver=r92.a1ed28e
pkgrel=1
pkgdesc="A configuration manager for Arch Linux"
arch=('any')
url="https://github.com/CyberShadow/aconfmgr"
license=('MIT')
depends=('bash' 'git' 'pacman' 'pacutils')
makedepends=('git')
optdepends=('pacaur: pacaur integration'
			'yaourt: yaourt integration'
			'augeas: configuration file editing')
source=("git+https://github.com/CyberShadow/aconfmgr"
	    "license.txt")
md5sums=('SKIP'
         '2c153a787e3a0974a4d4c5a005c53d99')

pkgver() {
  cd "$srcdir/aconfmgr"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -m755 -t "$pkgdir/usr/bin" "$srcdir/aconfmgr/aconfmgr"
  install -D -m644 -t "$pkgdir/usr/lib/aconfmgr" "$srcdir/aconfmgr/src/"*
  install -D -m644 -t "$pkgdir/usr/share/doc/aconfmgr" "$srcdir/aconfmgr/README.md"
  install -D -m644 -t "$pkgdir/usr/share/man/man1" "$srcdir/aconfmgr/aconfmgr.1"
  install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" license.txt
}
