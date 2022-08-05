# Maintainer: Laureano Passafaro <laureegrd at gmail dot com>
pkgname='pridefetch-laureegrd-git'
pkgver=r16.b2ee637
pkgrel=1
pkgdesc="An extension for pfetch with pride flags instead of ascii logos."
arch=(any)
url="https://gitlab.com/laureegrd/pridefetch"
license=('GPL')
# pfetch (non-git) is behind and does not have
# the required features as of August 4, 2022.
depends=('pfetch-git')
makedepends=('git')
# The conflict exists only because the script has the same name.
conflicts=('pridefetch' 'pridefetch-git')
source=('pridefetch-laureegrd-git::git+https://gitlab.com/laureegrd/pridefetch.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 "$srcdir/$pkgname/pridefetch" "$pkgdir/usr/bin/pridefetch"
}
