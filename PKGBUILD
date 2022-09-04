pkgname=esbuild-bin
pkgver=0.15.7
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
sha256sums=('6d9f01aad7f65eb8de693c771b0755a7383e38dec285e38e8e03ce21badbe652')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
