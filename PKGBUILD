# Maintainer: Kuan-Yen Chou <kuanyenchou at gmail dot com>

pkgname=cpp-coveralls-git
pkgver=20181011
pkgrel=1
pkgdesc='Upload gcov results to coveralls.io'
arch=('x86_64')
url='https://github.com/eddyxu/cpp-coveralls'
license=('Apache')
provides=('cpp-coveralls')
conflicts=('cpp-coveralls')
depends=('python' 'python-requests' 'python-future' 'python-certifi'
         'python-cryptography' 'python-pyopenssl' 'python-ipaddress')
makedepends=('python-setuptools')
source=('git+https://github.com/eddyxu/cpp-coveralls.git')
sha256sums=('SKIP')

build() {
        cd "${srcdir}/cpp-coveralls"
        python setup.py build
}

package() {
        cd "${srcdir}/cpp-coveralls"
        python setup.py install \
                -O2 --skip-build --root "${pkgdir}" --prefix=/usr
        install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/cpp-coveralls"
}

# vim: set ts=8 sw=8 et:
