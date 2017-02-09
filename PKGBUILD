# Maintainer: Chris Down <chris@chrisdown.name>
# Contributor: Shen Miren <dickeny@gmail.com>
# Contributor: Kan-Ru Chen <kanru@kanru.info>

pkgname=cconv
pkgver=0.6.3
pkgrel=1
pkgdesc="A iconv based simplified-traditional chinese conversion tool"
arch=('i686' 'x86_64')
url="https://github.com/xiaoyjy/cconv"
license=('GPL')
depends=(glibc)
options=(!libtool)
source=("https://github.com/xiaoyjy/cconv/archive/v$pkgver.tar.gz")
sha256sums=('82f46a94829f5a8157d6f686e302ff5710108931973e133d6e19593061b81d84')

build() {
    cd "${srcdir?}/$pkgname-$pkgver" || return 1
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || return 1
    make DESTDIR="${pkgdir?}/" install
}
