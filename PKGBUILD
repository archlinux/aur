# Maintainer: _Zaizen_ <leonardocanello@protonmail.com>

pkgname=dotto-git
_pkgname=Dotto
pkgver=r372.04c6720
pkgrel=1
pkgdesc=''
arch=('x86_64')
url='https://github.com/LibreSprite/Dotto'
license=('MIT')
depends=('sdl2' 'freetype2' 'libjpeg-turbo' 'sdl2_image' 'lua' 'lcms2')
makedepends=('make' 'git')

source=(
	"git+https://github.com/LibreSprite/Dotto.git"
)

sha256sums=(
    'SKIP'
)

pkgver() {
	cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	make
}

package() {
	cd "$_pkgname"
    install -Dm755 dotto "${pkgdir}/usr/bin/dotto"
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

