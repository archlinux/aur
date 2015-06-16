# Maintainer: Jurica Bradaric <jbradaric@gmail.com>
pkgname=python2-profilehooks
pkgver=1.8.0
pkgrel=1
pkgdesc="Decorators for profiling/timing/tracing individual functions"
arch=(any)
url="http://mg.pov.lt/profilehooks"
license=('custom:MIT')
depends=('python2')
makedepends=('python2' 'python2-setuptools')

source=("https://pypi.python.org/packages/source/p/profilehooks/profilehooks-1.8.0.tar.gz"
        "LICENSE")
sha256sums=('52277ed965938d8b6293aa41cb35278c72c9a6dd3f6e9f89c45da74767dbd6ea'
            '782297002c4e5baa591d289916113b39d8ae046e41855e6beb1266f26f9ec82a')

build() {
    cd "${srcdir}/profilehooks-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/profilehooks-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -D -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
