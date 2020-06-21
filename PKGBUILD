# Maintainer: Johan Förberg <johan@forberg.se>
pkgname=ttf-century-schoolbook
pkgver=r6.84beddf
pkgrel=1
pkgdesc='TTF version of the URW Century Schoolbook L font'
arch=('any')
url='https://github.com/TimothyGu/Century-Schoolbook-L'
license=('GPL2')
makedepends=('fontforge' 'git')
source=('git://github.com/TimothyGu/Century-Schoolbook-L.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/Century-Schoolbook-L"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Century-Schoolbook-L"
    make
}

package() {
    cd "$srcdir/Century-Schoolbook-L"

    mkdir -p "$pkgdir/usr/share/fonts/$pkgname"
    cp fonts/*.ttf "$pkgdir/usr/share/fonts/$pkgname"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
    sed -n 41,74p README.md >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
