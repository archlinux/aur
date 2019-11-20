pkgname=gedit-markdownpreview-git
pkgver=r25.d30ccef
pkgrel=2
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
	install -d "$pkgdir"/usr/share/gedit/plugins/markdownpreview
	cp markdownpreview.plugin markdownpreview.py style.css template.html \
		"$pkgdir"/usr/share/gedit/plugins/markdownpreview/
}
