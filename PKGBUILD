# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=wrench
pkgver=0.4.2
pkgrel=2
pkgdesc='a CLI tool for Passbolt'
arch=('any')
url='https://github.com/liip/wrench'
license=('GPL3')
depends=('python' 'python-requests-gpgauthlib')
makedepends=('python-setuptools')
source=("https://github.com/liip/wrench/archive/${pkgver}.tar.gz")
sha512sums=('b8f632e3fa4a813aa58bd6e59c393b0a0f7533cd7adbed46e7311ff2038919270e9ac6c89506f65d889b7a252a635cf4bd41072433af1e8f8a0f8036e712689d')

build() {
  cd ${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${pkgname}-${pkgver}
  NO_THIRD_PARTY=true python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
