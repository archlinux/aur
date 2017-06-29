# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

pkgname=markdown_previewer
pkgver=0
pkgrel=1
pkgdesc='Simple Markdown files previewer.'
arch=('i686' 'x86_64')
url='https://github.com/TomaszGasior/markdown_previewer'
depends=('php' 'zenity')
source=(
	"git+https://github.com/TomaszGasior/$pkgname.git"
	"markdown_previewer.desktop"
)
sha256sums=('SKIP' 'SKIP')

build() {
	cd "$srcdir/$pkgname"
	php "prepare_application.php"
}

package() {
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"

	cd "$srcdir/$pkgname"
	cp "markdown_previewer" "$pkgdir/usr/bin/"
	cp "../markdown_previewer.desktop" "$pkgdir/usr/share/applications/"
}