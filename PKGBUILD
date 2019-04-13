# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
pkgname=ffmpeg-normalize
pkgver=1.3.10
pkgrel=2
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=(ffmpeg python python-tqdm)
makedepends=(python-setuptools python-pypandoc)
conflicts=("${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/f/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('0d31e5c65959d00ce23c4fb83af530f684598c5e93ac55f7b385cecea03f87f5369f366ab5947d88dce990986662c80ba5142ca27a06a021413f498018df3659')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
