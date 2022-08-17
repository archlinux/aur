pkgname=esbuild-bin
pkgver=0.15.5
pkgrel=1
pkgdesc="An extremely fast JavaScript and CSS bundler and minifier."
arch=('x86_64')
url="https://esbuild.github.io"
license=('MIT')

_name="${pkgname%-bin}"
provides=("${_name}")
conflicts=("${_name}")

_npmpkg="${_name}-linux-64"
_archive="${_npmpkg}-${pkgver}.tgz"

source=("${_archive}::https://registry.npmjs.org/${_npmpkg}/-/${_archive}")
sha256sums=('f0a088031896ed8d3b0a4fc4eb0fed6881a57607bcf57673fe8f7c67832f3ae0')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
