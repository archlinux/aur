# Maintainer: robertfoster

pkgname=extract-dtb
pkgver=1.2.2
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

sha256sums=('6d67cb875ba936a839021b32fd6c00e876a9a400e6b4d4989310c276c6be6b78')
