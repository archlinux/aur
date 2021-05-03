# Maintainer: Matt C <matt@xhec.us>
# Upstream author: jnats <jnats@salyut.one>
pkgname=notop-git
_pkgname=notop
pkgver=1.0
pkgrel=1
pkgdesc="no-bullshit, general purpose process management program"
arch=('any')
url="https://github.com/jnats/notop"
license=('custom:nolicense')
depends=('procps-ng' 'coreutils' 'sed' 'bc')
provides=('notop')

source=("notop::git+https://github.com/jnats/notop.git")

md5sums=('SKIP')

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$_pkgname
	cd $_pkgname
	chmod +x notop
	cp notop $pkgdir/usr/bin
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
