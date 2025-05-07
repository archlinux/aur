# Maintainer: Sadie <zulc22db+oss@gmail.com>
pkgname=osc-dl-git
pkgver=r746.4cb600e
pkgrel=1
pkgdesc="Desktop utility for downloading homebrew apps from the Open Shop Channel."
arch=('any')
url="https://github.com/dhtdht020/osc-dl"
license=('GPL-3.0-only')
groups=()
depends=('python>=3.12' 'python<4.0'
	'python-requests'
	'python-packaging'
	'python-markdown'
	'python-pillow'
	'python-pyserial'
	'python-darkdetect'
	'python-func-timeout'
	'pyside6'
)
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('osc-dl::git+https://github.com/dhtdht020/osc-dl.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/osc-dl"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

# prepare() {
# 	cd "$srcdir/osc-dl"
# 	git submodule update --init
# 	patch --forward --strip=1 --input="${srcdir}/../metamorphose2.patch"
# }

package() {
	cd "$srcdir/osc-dl"
	mkdir -p "$pkgdir/opt/osc-dl" "$pkgdir/usr/share/pixmaps" "$pkgdir/usr/share/applications"
	cp -r . "$pkgdir/opt/osc-dl/"
	cp ./assets/gui/icons/oscdl-icon.png "$pkgdir/usr/share/pixmaps/osc-dl.png"
	cp "$srcdir/../osc-dl.desktop" "$pkgdir/usr/share/applications/osc-dl.desktop"
}
