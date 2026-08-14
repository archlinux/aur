# Maintainer: Thorsten Toepper <atsutane-aur at freethoughts dot de>
# Contributor: Ivan Batrakov <blackfan321 at disroot dot org>
# Contributor: Benjamin A. Shelton <zancarius@gmail.com>

pkgname=python-httpagentparser
pkgver=1.9.9
pkgrel=1
pkgdesc='Extracts OS browser information from the user agent string.'
arch=('any')
url='https://github.com/shon/httpagentparser/tree/master'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'git')

source=("git+https://github.com/shon/httpagentparser#tag=v${pkgver}")
sha256sums=('cc68e584e05d53fee2590b3e5d63f3318ee1e94a8008dc57b58383131e00fb0a')

build () {
    cd "${srcdir}/httpagentparser"
    python -m build --wheel --no-isolation
}

package () {
    cd "${srcdir}/httpagentparser"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
