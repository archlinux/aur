# Maintainer: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=sfzlint
pkgver=0.1.5
pkgrel=1
pkgdesc='A linter and parser for SFZ files'
arch=(any)
url='https://github.com/jisaacstone/sfzlint'
license=(GPL)
depends=(python-appdirs python-lark-parser python-yaml)
makedepends=(python-setuptools)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jisaacstone/sfzlint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5cdc108fa6965101b1865de836468c8e4c54270af643b96dc0c377130b6ee7b')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --skip-build --root="$pkgdir"/ --optimize=1
}
