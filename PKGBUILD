# Maintainer: Astro Benzene <universebenzene at sina dot com>
_pyname=iminuit
pkgname=python-${_pyname}-doc
pkgver=2.3.0
pkgrel=1
pkgdesc="Documentation for Python iminuit module"
arch=(any)
url="http://iminuit.readthedocs.io"
license=('GPL' 'MIT')
makedepends=("python-${_pyname}=${pkgver}" 'python-sphinx' 'python-sphinx_rtd_theme' 'python-matplotlib' 'python-pillow')
source=("https://github.com/iminuit/iminuit/archive/v${pkgver}.tar.gz")
md5sums=('1fbbe44e520e48ffe7d493e541d4e830')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    make build/html/done
}

package() {
    cd ${srcdir}/${_pyname}-${pkgver}/build

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    cp -a html "${pkgdir}/usr/share/doc/${pkgname%-doc}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ../LICENSE
}
