# Maintainer: Rustem B. <rustemb@systemli.org>
pkgname=bitfetch
pkgver=2.2
pkgrel=1
pkgdesc="Simple fetch written in C."
arch=(any)
url="https://gitlab.com/bit9tream/bitfetch"
license=('GPL2')
groups=()
depends=(libx11 libxinerama)
makedepends=(git pkgconf)
checkdepends=()
optdepends=()
provides=(bitfetch)
source=("https://gitlab.com/bit9tream/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=("6be582f6e2440eb35c0ffba7b8ff0de9")

build() {
    cd "${pkgname}-${pkgver}"
    make bitfetch
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/bitfetch/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/bitfetch/LICENSE"
    make DESTDIR="$pkgdir/" install

}
