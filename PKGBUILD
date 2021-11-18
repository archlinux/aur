# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

pkgname=python-libversion
pkgver=1.2.4
pkgrel=1
pkgdesc="Python bindings for libversion"
url='https://pypi.org/project/libversion'
license=('MIT')
arch=('x86_64' 'i686')
depends=('python' 'libversion')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/repology/py-libversion/archive/${pkgver}.tar.gz")
sha256sums=('9edda48b2f030cb95b0de41aae21f9983a412909d806184f32027c26d7bf2919')
b2sums=('998b1a1d1e1666a239f21a9bf84c0ec89b80fa7cb4ae0e7fb773131e561d4598f01e232451201ae06e8aeb0efad89c2ce6661e3f7f14212d564924818ca90d7f')

build() {
  cd "py-libversion-${pkgver}"

  python setup.py build
}

package() {
  cd "py-libversion-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
