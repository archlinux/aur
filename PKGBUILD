# Maintainer: Jonathon Fernyhough <jonathon@manjaro.org>

pkgname=lily
pkgver=0.18
pkgrel=1
pkgdesc='An interpreted language with a focus on expressiveness and type safety'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://fascinatedbox.github.io/lily/"
license=('MIT')
depends=('glibc')
makedepends=('cmake')
provides=('lily')
conflicts=('lily')
source=("https://github.com/fascinatedbox/lily/archive/v${pkgver}.tar.gz")
sha256sums=('87ca3fb6d5c84f8dab78fb3bcf52ac74988a77ae21a01e43b02e82fbd8ed936f')

build() {
    cd "${srcdir}/lily-${pkgver}"
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
    make
}

package() {
    cd "${srcdir}/lily-${pkgver}"
    make DESTDIR="${pkgdir}/" install
    install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
