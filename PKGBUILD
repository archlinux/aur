# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
pkgname=ffmpeg-normalize
pkgver=1.15.1
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=(ffmpeg python python-tqdm)
makedepends=(python-setuptools python-pypandoc)
conflicts=("${pkgname}-git")
source=("https://github.com/slhck/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('6aecc0441320ce335df10f2fefe42b1e30e9e3422f541821a2cbe2343296f6e479e933ed23050575490bd3e06b38d23275535ec80a712f9a470c8863b4819489')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
