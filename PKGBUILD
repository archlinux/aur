# Maintainer:   Sian1468 <setthawut DOT a AT protonmail DOT com>
# Contributor:  Julien Nicoulaud <julien DOT nicoulaud AT gmail DOT com>

pkgname=ffmpeg-normalize
pkgver=1.20.2
pkgrel=1
pkgdesc="Audio normalization using ffmpeg."
arch=(any)
url="https://github.com/slhck/ffmpeg-normalize"
license=(MIT)
depends=(ffmpeg python-tqdm python-colorama)
makedepends=(python-setuptools)
conflicts=("${pkgname}-git")
source=("$url/archive/v${pkgver}.tar.gz")
sha512sums=('b4830aa2cf1faf2895ad0ba827efeaeec6f05d9e3d829eace8ce284c617900778e3a901f234e09ad6558ac36c91d1569565aad94169ffb8593275594d48092d6')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}
check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python test/test.py
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
