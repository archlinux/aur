# Maintainer: Matt C <matt@xhec.us>
pkgname=nofetch-git
_pkgname=nofetch
pkgver=$(date +"%m-%d-%y" | sed 's/-/_/g')
pkgrel=1
pkgdesc="the simple man's fetch tool"
arch=('any')
url="https://github.com/jnats/nofetch"
license=('custom:nolicense')
depends=('coreutils' 'grep' 'sed' 'bash')
provides=('nofetch')

source=("nofetch::git+https://github.com/jnats/nofetch.git")

md4sums=("SKIP")

package() {
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/share/licenses/$_pkgname
	cd $_pkgname
	chmod +x nofetch
	cp nofetch $pkgdir/usr/bin
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
md5sums=('SKIP')
