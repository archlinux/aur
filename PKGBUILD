# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gedit-markdownpreview-git
_pkgname=markdownpreview
pkgver=r25.d30ccef
pkgrel=4
pkgdesc="Show side by side preview of markdown files"
arch=('any')
url="https://github.com/aliva/gedit-markdownpreview"
license=('GPL2')
depends=('gedit' 'python-markdown')
makedepends=('git')
optdepends=('pymdown-extensions')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/aliva/gedit-markdownpreview')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm644 "$_pkgname.plugin" "$_pkgname.py" style.css template.html -t \
		"$pkgdir/usr/lib/gedit/plugins/$_pkgname"
}
