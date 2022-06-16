# Maintainer : Frikilinux <frikilinux@gmail.com>
# Contributor : peeweep <peeweep at 0x0 dot ee>

pkgname=python-aigpy
_name=${pkgname#python-}
pkgver=2022.6.15.1
pkgrel=1
pkgdesc="Python Common Lib"
arch=('any')
url="https://github.com/yaronzz/AIGPY"
license=('MIT')
depends=('python-requests' 'python-colorama' 'python-mutagen')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")

sha256sums=('6151b5656f563ec891df8825e8e53b4a4ffb466c3f14c84f886eff8176bbe047')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
