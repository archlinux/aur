# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=uvicorn
pkgver=0.3.21
pkgrel=1
pkgdesc="The lightning-fast ASGI server."
arch=('any')
url="https://www.uvicorn.org/"
license=('BSD')
depends=('python>=3.5' 'python-click' 'python-h11'
         'python-httptools' 'python-uvloop' 'python-websockets>=6.0')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/encode/uvicorn/archive/${pkgver}.tar.gz")
sha256sums=('f333d74f94a4a82fb723ac19b207647f65269ee46dc3e31f7322f3fe6e176d6d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
