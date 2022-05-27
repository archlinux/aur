pkgname=esbuild-bin
pkgver=0.14.41
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
sha256sums=('ddaccf58d6b98767e5ed136c63bf1b011e19571b2672f12de393b47c904ba14f')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
