pkgname=esbuild-bin
pkgver=0.14.37
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64')
url="https://esbuild.github.io"
license=('MIT')

_name="${pkgname%-bin}"
provides=("${_name}")
conflicts=("${provides[@]}")

_npmpkg="${_name}-linux-64"
source=("${_npmpkg}-${pkgver}.tgz::https://registry.npmjs.org/${_npmpkg}/-/${_npmpkg}-${pkgver}.tgz")
sha256sums=('8d4244918ca5921272057053d1d67b805dfd9b62e794a9f67b3bfc7ea26dd672')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
