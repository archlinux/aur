# Maintainer: Acidhub <dev@acidhub.click>

pkgname=stlib-plugins-git
pkgver=20190108.27.c3ce42e
pkgrel=1
pkgdesc="A set of stlib official plugins"
arch=('x86_64')
url="https://github.com/ShyPixie/stilib-plugins"
depends=('python>=3.6' 'python-aiohttp' 'python-beautifulsoup4')
makedepends=('git')
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

