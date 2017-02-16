# Maintainer: Eisfreak7 <eisfreak7@gmail.com>

pkgname=xtitle
pkgver=0.4.3
pkgrel=1
pkgdesc='Outputs X window titles'
arch=('i686' 'x86_64')
url="https://github.com/baskerville/${pkgname}"
license=('custom:Unlicense')
depends=('libxcb' 'xcb-util-wm' 'xcb-util')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=('884843193195e8b6293bafd510ecb69e')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
