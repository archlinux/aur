# Maintainer: Noah Vogt <noah@noahvogt.com>
pkgname=issuu-dl
pkgver=0.5.1
pkgrel=1
pkgdesc="a simple downloader for issuu.com (supports pdf and cbz output formats)"
arch=("any")
url="https://github.com/noahvogt/issuu-dl"
license=('GPL3')
depends=('python-termcolor' 'img2pdf' 'python-tqdm' 'python-typer')
source=("$pkgname::git+https://github.com/noahvogt/issuu-dl.git")
md5sums=('SKIP')

package() {
	cd "$pkgname"
    git checkout "v$pkgver"
	install -Dm755 issuu-dl $pkgdir/usr/bin/issuu-dl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
