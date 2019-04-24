# Maintainer: Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>
pkgname=ffmpeg-normalize
pkgver=1.14.0
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=(ffmpeg python python-tqdm)
makedepends=(python-setuptools python-pypandoc)
conflicts=("${pkgname}-git")
source=("https://files.pythonhosted.org/packages/source/f/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('f914fabcfbadb7586f4b2171babfb77648abe88e2e479367b24b6fb8b7bbc60fb105998d85fa64ef0d13071d82700938115c2a64186c0ed222402d12826221d0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
