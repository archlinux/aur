# Maintainer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-librosa
_pkgname=librosa
pkgver=0.10.0
pkgrel=1
pkgdesc="Python library for music and audio analysis"
arch=('any')
url="https://librosa.org"
license=('ISC')
depends=('python-numpy' 'python-scipy' 'python-six' 'python-numba' 'python-soundfile' 'python-joblib' 'python-matplotlib' 'python-audioread' 'python-decorator' 'python-pooch' 'python-scikit-learn' 'python-resampy')
makedepends=('python-setuptools')
source=("https://github.com/librosa/librosa/archive/${pkgver}.tar.gz")
md5sums=('b8f07a93f266d650d38a974dfc9a6856')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
