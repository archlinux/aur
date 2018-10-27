# Maintainer: Acidhub <dev@acidhub.click>

pkgname=stlib-plugins-git
pkgver=20181026.26.c1e9e59
pkgrel=1
pkgdesc="A set of stlib official plugins"
arch=('x86_64')
url="https://github.com/ShyPixie/stilib-plugins"
depends=('python>=3.7' 'python-aiohttp' 'python-beautifulsoup4')
makedepends=('python>=3.7' 'git')
license=('GPL')
source=("git+https://github.com/ShyPixie/${pkgname%-*}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-*}"
	echo "$(date +%Y%m%d).$(git rev-list --count master).$(git rev-parse --short master)" 
}

build() {
    cd "${pkgname%-*}"
    make
}

package() {
    cd "${pkgname%-*}"
    make DESTDIR="$pkgdir" PREFIX="/usr" install
}

