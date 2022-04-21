pkgname=esbuild-bin
pkgver=0.14.38
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
sha256sums=('9d26a22a0ea2f06437fa9d43cdeea830a9ccd1dfefd243fa2122693051772b67')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
