# Contributor: Benjamin Chrétien <chretien+aur at lirmm dot fr>
# Contributor: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cpp-coveralls
pkgver=0.4.2
pkgrel=2
pkgdesc='Upload gcov results to coveralls.io'
arch=('x86_64')
url='https://github.com/eddyxu/cpp-coveralls'
license=('Apache')
depends=('python' 'python-requests' 'python-yaml')
makedepends=('python-setuptools')
source=("https://github.com/eddyxu/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a5b7a5a92531a6b5d8e19724fad4259fb233f341e5b76df2723a040894a0d24a')

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
