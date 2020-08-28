# Maintainer: relrel <relrelbachar@gmail.com>
# Contributor: Kirill Klenov <horneds@gmail.com>
# Contributor: Mikhail felixoid Shiryaev <mr dot felixoid na gmail com>
pkgname=kotlin-vim
pkgver=r75.2697016
pkgrel=1
pkgdesc="Kotlin plugin for Vim"
arch=('any')
url="https://github.com/udalov/$pkgname"
license=('Apache')
groups=(vim-plugins)
depends=(vim)
makedepends=(git)
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"

	install -d "$pkgdir/usr/share/vim/vimfiles/"
	cp -r -t "$pkgdir/usr/share/vim/vimfiles/" syntax/ indent/ ftdetect/ ftplugin/

	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
