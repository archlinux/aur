# Maintainer: Jason Nader <jason.nader [] protonmail.com>
# Maintainer: Sian1468 <sian1468-aur@.39011468.xyz>

pkgname=python-ffmpeg-progress-yield
_name=${pkgname#python-}
pkgver=0.6.1
pkgrel=1
pkgdesc="Run an ffmpeg command with its progress yielded."
arch=('any')
url="https://github.com/slhck/ffmpeg-progress-yield"
license=('MIT')
depends=('python-colorama' 'python-tqdm')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha512sums=('427356067319e33546b48bad8297094ff0d0efba5b9c4b324bf7996ebbea8c79944c58d799e7a5f8c03a738dc082172afef8561ef2ba73eb2149a1d4e3c92d33')

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}
check() {
  cd ${_name}-${pkgver}
  python test/test.py
}
package() {
  cd ${_name}-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
