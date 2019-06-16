# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
pkgname=ffmpeg-normalize
pkgver=1.14.1
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=(ffmpeg python python-tqdm)
makedepends=(python-setuptools python-pypandoc)
conflicts=("${pkgname}-git")
source=("https://github.com/slhck/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('4bad8f7e09e14c8ec62eb908712ed2336653648a940b04a314090ede574015f75407aa5d0e07dad480d8c9f596a7fd7448e5227ac23af99116a2deedb498afe5')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
