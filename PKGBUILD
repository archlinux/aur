# Maintainer: Rustem B. <rustemb@systemli.org>
pkgname=bitfetch
pkgver=2.3
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
md5sums=("74006791d5b5b42e71ac2cc4bcc05db5")

# for this time Artix users can set ID=artix to build it for Artix Linux
build() {
    cd "${pkgname}-${pkgver}"
    [ -f "/etc/os-release" ] && make bitfetch || make bitfetch ID=asd
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/bitfetch/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/bitfetch/LICENSE"
    make DESTDIR="$pkgdir/" install

}
