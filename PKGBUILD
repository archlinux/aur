# Maintainer: mickybart <mickybart at pygoscelis dot org>

pkgname=('python-pwgen')
pkgver='0.8.2'
pkgrel=1
_commit='b86d7d5bebfa892e7bc13f120875cf5a0bd54f5f'
pkgdesc="Pure python version of pwgen"
url="https://github.com/vinces1979/pwgen"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("${pkgname}::git+https://github.com/vinces1979/pwgen#commit=${_commit}"
        'LICENSE')
md5sums=('SKIP'
         'cb7e4c838dfe63b7bd3c4115141f8f30')

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

