pkgname=esbuild-bin
pkgver=0.14.42
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
sha256sums=('61b987f8703500e7e932cdee6488c7abd79dba6507570ac67029cc311eafba36')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
