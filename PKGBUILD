# Maintainer: Eisfreak7 <eisfreak7@gmail.com>

pkgname=xtitle
pkgver=0.4.2
pkgrel=2
pkgdesc='Outputs X window titles'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${pkgname}"
license=('custom:Unlicense')
depends=('libxcb' 'xcb-util-wm' 'xcb-util')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('78c531089280b5b88a77ca06b6c74dd2')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
