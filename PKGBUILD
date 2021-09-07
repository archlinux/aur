# Maintainer: Evgeniy Alekseev

pkgname=python-pydeps
_pkgname=pydeps
pkgver=1.9.14
pkgrel=1
pkgdesc="python module dependency visualization tool"
arch=('any')
url="https://github.com/thebjorn/pydeps"
license=('BSD2')
depends=('python-pyaml' 'python-stdlib-list')
source=("https://github.com/thebjorn/pydeps/archive/refs/tags/v${pkgver}.tar.gz")

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('4b1bc5304e70fdb4a83965c61f723d7b814a0fa80cc50f11f1d1b2696bf225ecb8de747a5be90d329d480a645c255e76eba13abb453f1bba875add8e0ed2395d')
