# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

__commit="a576155f380612c84bbcd05dcfc56dcb2c34e0ac"

pkgname=markdown_previewer
pkgver=2_${__commit:0:5}
pkgrel=1
pkgdesc='Simple Markdown files previewer.'
arch=('i686' 'x86_64')
url='https://github.com/TomaszGasior/markdown_previewer'
depends=('php' 'zenity')
source=(
	"git+https://github.com/TomaszGasior/$pkgname.git#commit=$__commit"
	"markdown_previewer.desktop"
)
sha256sums=('SKIP' 'SKIP')

build()
{
	cd "$srcdir/$pkgname"
	php "prepare_application.php"
}

package()
{
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/applications"

	cp "$srcdir/$pkgname/markdown_previewer" "$pkgdir/usr/bin/"
	cp "$srcdir/markdown_previewer.desktop" "$pkgdir/usr/share/applications/"
}