_reponame='toml.lang'
pkgbase=gtksourceview-highlight-toml
pkgname=('gtksourceview2-highlight-toml' 'gtksourceview3-highlight-toml')
pkgver=r8.8f3dd72
pkgrel=1
pkgdesc='TOML syntax highlighting for gtksourceview'
arch=('any')
url=('https://github.com/liv-dumea/toml.lang')
license=('GPL')
source=('git+https://github.com/liv-dumea/toml.lang.git')
sha512sums=('SKIP')


pkgver() {
	cd "$_reponame"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_gtksourceview2-highlight-toml() {
	depends=('gtksourceview2')

	install -Dm644 $srcdir/$_reponame/toml.lang "$pkgdir/usr/share/gtksourceview-2.0/language-specs/toml.lang"
}

package_gtksourceview3-highlight-toml() {
	depends=('gtksourceview3')

	install -Dm644 $srcdir/$_reponame/toml.lang "$pkgdir/usr/share/gtksourceview-3.0/language-specs/toml.lang"
}

