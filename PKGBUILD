# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang
pkgver=0.4.1
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
depends=()
makedepends=('git' 'clang')
provides=('janet')
conflicts=('janet-lang-git')
source=("https://github.com/janet-lang/janet/archive/v${pkgver}.tar.gz")
sha256sums=('ad5eaa7adf714fc1fff743a739e30ba3f69bbde87abcba27c733b7a1b91d702e')

#prepare() {
#    cd "${srcdir}/${_pkgname}-${pkgver}"
#}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}/usr" CC=clang -j7
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}/usr" install
}
