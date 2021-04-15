# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=minlau-git
_pkgname=minlau
pkgver=1.0.1
pkgrel=1
pkgdesc="A minimalist game launcher for wine"
url="https://github.com/theRealCarneiro/minlau"
arch=('i686' 'x86_64')
license=('MIT')
depends=('wine')
makedepends=('git')
optdepends=('gamemode')
source=(
		${_pkgname}::git+${url}.git
		)
md5sums=(
'SKIP'
)

package() {
	cd $_pkgname
	install -Dm755 src/minlau "$pkgdir/usr/bin/minlau"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm644 completion/_minlau "$pkgdir/usr/share/zsh/site-functions/_minlau"
	install -Dm644 minlau.1 "$pkgdir/usr/share/man/man1/minlau.1"
}
