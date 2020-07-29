# Maintainer: dplusdplus <echo cmFuZG9tdGVzdG5hbWUtYXQtZ21haWwoZG90KWNvbQo= | base64 -d>

pkgname=ttf-antonio
pkgver=1.01
pkgrel=1
pkgdesc="A 'refined' version of the Anton font, a large typeface designed for banners and headlines"
url="https://github.com/vernnobile/antonioFont"
arch=(any)
license=('OFL')
makedepends=('git')
source=("git+${url}#commit=4b3e07ab5647a613931153a09067a785f54b980a")
sha256sums=('SKIP')

_ttf_files_paths=("Regular/Antonio-Regular.ttf"
"Light/Antonio-Light.ttf"
"Bold/Antonio-Bold.ttf")

package() {
	cd "$srcdir/antonioFont"

	install -d "$pkgdir/usr/share/fonts/${pkgname%-fonts}"

	for ttf_file in "${_ttf_files_paths[@]}"; do
		install -m644 "$ttf_file" "$pkgdir/usr/share/fonts/${pkgname%-fonts}"
	done
}
