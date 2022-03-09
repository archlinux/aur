# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
_pkgname="${pkgname#python-}"
pkgver=1.2.2
pkgrel=1
pkgdesc="Binary diff and patch using the BSDIFF4-format"
url="https://github.com/ilanschnell/${_pkgname}"
depends=('python')
license=('BSD')
arch=('x86_64')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ilanschnell/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('a263143ebd5316b7eb92b454a865d3c74491f075d12bc177e52031dc9a9f5e926e073de795ed6d67b91ad7c10fd18b28f55b24a1cc7ce59c2e968b8ac78521ee')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

