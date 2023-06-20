# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-glog
pkgver=0.3.1
pkgrel=5
pkgdesc='A simple Google-style logging wrapper for Python'
arch=('any')
url='https://github.com/benley/python-glog/'
license=('BSD')
depends=('python' 'python-gflags' 'python-six')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://github.com/benley/python-glog/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('b01af6f1118d2fa769c7657971deac8cecd71a3c6afe3e08328366740e802351')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "${pkgname}-${pkgver}/dist"/*.whl
    install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
