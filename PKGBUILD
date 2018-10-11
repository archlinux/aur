# Submitter: Benjamin Chrétien <chretien+aur at lirmm dot fr>
# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cpp-coveralls
pkgver=0.4.0
pkgrel=2
pkgdesc='Upload gcov results to coveralls.io'
arch=('x86_64')
url='https://github.com/eddyxu/cpp-coveralls'
license=('Apache')
depends=('python' 'python-requests' 'python-future' 'python-certifi'
         'python-cryptography' 'python-pyopenssl' 'python-ipaddress')
makedepends=('python-setuptools')
source=("https://github.com/eddyxu/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('973992c11d6eda3e640cd6e40f6c7b7f73b3739d403e320360a466e46e41a697')

build() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        python setup.py build
}

package() {
        cd "${srcdir}/${pkgname}-${pkgver}"
        python setup.py install \
                -O2 --skip-build --root "${pkgdir}" --prefix=/usr
        install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: set ts=8 sw=8 et:
