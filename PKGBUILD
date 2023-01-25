# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-tqdm')
makedepends=('python-setuptools')
#checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('5a1e5b4ce749d7a6d8aaddccf44d2ab2a760b3cd7e73f1d0e1a699a356d1f16472f0d33b1b1ad5f9d234f9bc4654cf8775d300e2fbb04051c28cac152c9b4423')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}
#check() {
#  cd ${_name}-${pkgver}
#  pytest test/test.py
#}
package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
