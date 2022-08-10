pkgname=esbuild-bin
pkgver=0.15.1
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
sha256sums=('c14a4c269fff44f7ded80992ac93687b9262c6ab18ee39c29b8a73ba1659dbb9')

package() {
    cd "${srcdir}/package/bin"
    install -Dm755 -t "${pkgdir}/usr/bin" "${_name}"
}
