# Maintainer: Leo <i@setuid0.dev>
_reponame=pgsql.vim
pkgname=vim-pgsql
pkgver=2.3.1
pkgrel=2
epoch=
pkgdesc="Vim syntax highlighting and auto-completion support for PostgreSQL"
arch=('any')
url="https://github.com/lifepillar/pgsql.vim"
license=('custom:vim')
groups=()
depends=('vim-runtime')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/lifepillar/pgsql.vim/archive/refs/tags/v$pkgver.tar.gz"
	"20220208-upstream.patch"
)
noextract=()
md5sums=('SKIP' 'SKIP')
validpgpkeys=()

prepare() {
	cd $srcdir/$_reponame-$pkgver
	patch -p1 -i "$srcdir/20220208-upstream.patch"
}

package() {
	install -D -m 644 \
		$srcdir/$_reponame-$pkgver/syntax/pgsql.vim \
		$pkgdir/usr/share/vim/vim82/syntax/pgsql.vim
}
