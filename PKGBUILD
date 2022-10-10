# Maintainer: robertfoster

pkgname=extract-dtb
pkgver=1.2.3
pkgrel=1
pkgdesc="Tool to split a kernel image with appended dtbs into separated kernel and dtb files"
arch=('any')
url="https://github.com/PabloCastellano/extract-dtb"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')

source=("${url}/archive/refs/tags/$pkgver.tar.gz")

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  rm ${pkgdir}/usr/{CHANGES.md,LICENSE}
}

sha256sums=('a8a5b461c9e5fd564316566f63f5fe7458da69af68d59d60e0a66a3965099ada')
