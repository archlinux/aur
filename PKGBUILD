pkgname=esbuild-bin
pkgver=0.14.43
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64')
url="https://esbuild.github.io"
license=('MIT')

_name="${pkgname%-bin}"
provides=("${_name}")
conflicts=("${_name}")

_npmpkg="${_name}-linux-64"
source=("${_npmpkg}-${pkgver}.tgz::https://registry.npmjs.org/${_npmpkg}/-/${_npmpkg}-${pkgver}.tgz")
sha256sums=('47473ffd5df7da880888c59cdfe6cdb793c7a7df9596f856cd4606e58b338cc9')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
