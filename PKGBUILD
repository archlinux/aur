# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
_pkgname=setoptconf
pkgname=python-setoptconf
pkgver=0.2.0
pkgrel=1
pkgdesc="A library that can be used to retrieve program settings from a variety of sources"
arch=('any')
url="https://github.com/jayclassless/setoptconf"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=(https://github.com/jayclassless/setoptconf/archive/${pkgver}.tar.gz)
md5sums=('f2a056f7546c9b3a8e0ff6f6e688065d')

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
