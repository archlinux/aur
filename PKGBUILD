# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>

_pkgname=dodgy
pkgname=python-dodgy
pkgver=0.1.9
pkgrel=1
pkgdesc="Looks at Python code to search for things which look dodgy such as passwords or diffs"
arch=('any')
url="https://github.com/landscapeio/dodgy"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/landscapeio/dodgy/archive/${pkgver}.tar.gz)
md5sums=('fd268f48162cc6a5dc62f784b7d61e85')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"

    python setup.py install --prefix="/usr" --root="${pkgdir}" --optimize=1
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}"/LICENSE
}
# vim:set ts=2 sw=2 et:
