# Maintainer: _Zaizen_ <leonardocanello@protonmail.com>

pkgname=dotto-git
_pkgname=Dotto
pkgver=r372.672887f
pkgrel=1
pkgdesc=''
arch=('x86_64')
url='https://github.com/LibreSprite/Dotto'
license=('MIT')
depends=('sdl2' 'sdl2_image' 'freetype2' 'libjpeg-turbo' 'lua' 'lcms2' 'v8-r')
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

