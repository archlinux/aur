# Maintainer: Eisfreak7 <eisfreak7@gmail.com>

pkgname=xtitle
pkgver=0.4
pkgrel=1
pkgdesc='Outputs X window titles'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${pkgname}"
license=('custom:Unlicense')
depends=('libxcb' 'xcb-util-wm' 'xcb-util')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://www.github.com/baskerville/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4441a643be4674baf39f96d421d92b7e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
