# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Carl George < arch at cgtx dot us >

pkgname=plotinus
pkgver=0.2.0
pkgrel=1
pkgdesc='A searchable command palette for GTK3 applications'
arch=('i686' 'x86_64')
url='https://github.com/p-e-w/plotinus'
license=('GPL3')
depends=('gtk3')
makedepends=('vala' 'cmake')
source=("https://github.com/p-e-w/plotinus/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "plotinus.sh")
sha256sums=('6d814d19e6868f3d52ecd923ad6da465c632bb5dfcdc97c5245ad107e582c33b'
            '96fad14ace388edf164b5158adb507765b2bd1fe5c9435c41081ffa8ac2cec11')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 --target-directory "${pkgdir}"/usr/lib libplotinus.so
    install -Dm644 --target-directory "${pkgdir}"/etc/profile.d "${srcdir}"/plotinus.sh
}
