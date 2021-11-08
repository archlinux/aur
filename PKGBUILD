# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

_electron=electron
_repo=https://github.com/ajbura/cinny
pkgname=(cinny-web)
pkgbase=cinny
pkgver=1.5.0
_commit=2c9e32b6c472df133a68d19754ed7e5e9691fc31
pkgrel=1
pkgdesc='Yet another matrix client — '
arch=(any)
url=https://cinny.in
license=(MIT)
depends=()
makedepends=(npm git)
source=("$pkgbase-web::git+$_repo.git#commit=$_commit")
sha512sums=('SKIP')

build() {
	cd "$pkgbase-web"
	npm install
	npm run build
}

package_cinny-web() {
	pkgdesc+='web version'

	cd "$pkgbase-web"

	install -d "$pkgdir/usr/share/webapps/cinny"

	cp -r dist/* "$pkgdir/usr/share/webapps/cinny"
}
