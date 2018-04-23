# Maintainer: mickybart <mickybart at pygoscelis dot org>

pkgname=('python-openbrokerapi')
pkgver='2.0.0'
pkgrel=1
pkgdesc="A python package for the V2 CF Service Broker API and Open Broker API (version 2.13+)"
url="https://github.com/eruvanos/openbrokerapi"
depends=('python' 'python-flask')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}::git+https://github.com/eruvanos/openbrokerapi#tag=v${pkgver}"
        'LICENSE')
md5sums=('SKIP'
         '01fd3820ef015cfa1c6143d706106489')

build() {
    cd "${srcdir}/${pkgname}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    # license
    install -Dm644 "${srcdir}/LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

