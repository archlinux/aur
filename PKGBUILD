# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: zhullyb <zhullyb@outlook.com>

pkgname=python-bsdiff4
pkgver=1.2.2
pkgrel=1
pkgdesc="Binary diff and patch using the BSDIFF4-format"
arch=('x86_64')
url="https://github.com/ilanschnell/${pkgname##*-}"
license=('BSD')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('a263143ebd5316b7eb92b454a865d3c74491f075d12bc177e52031dc9a9f5e926e073de795ed6d67b91ad7c10fd18b28f55b24a1cc7ce59c2e968b8ac78521ee')

build() {
  cd "${pkgname##*-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname##*-}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

