# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=pkgbuild-introspection
pkgver=8
pkgrel=1
pkgdesc='Tools for generating .SRCINFO files and PKGBUILD data extraction (mkaurball)'
url="https://github.com/falconindy/$pkgname"
license=('MIT')
arch=('any')
depends=('bash' 'pacman')
makedepends=('git')
provides=('pkgbuild-introspection')
conflicts=('pkgbuild-introspection-git')
source=("https://github.com/falconindy/$pkgname/archive/$pkgver.tar.gz")
md5sums=('056df99fa7432387acb4295a6800cf46')

build() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make
}

package() {
    cd -- "${srcdir?}/$pkgname-$pkgver"
    make install PREFIX=/usr DESTDIR="$pkgdir"
}
