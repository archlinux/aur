# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=kara
pkgver=1.2.2.beta
_pkgver=1.2.2-beta
pkgrel=1
pkgdesc='Open Source Voice Assistant'
arch=('any')
url='https://github.com/emileclarkb/Kara'
license=('GPL3')
depends=('python-speechrecognition'
         'python-pyttsx3'
         'python-pyaudio'
         'python-wheel'
         'python-pathlib'
         'python-termcolor'
         'python-colorama'
         'python-ffmpeg'
         'python-geocoder')
makedepends=('python-setuptools')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/emileclarkb/Kara/archive/v${_pkgver}.tar.gz")
sha256sums=('d0d286708ca079946408388e88fe8cca2f7d1856075d82df2e92f022db54e04d')

build() {
  cd "Kara-${_pkgver}"
  python setup.py build
}

package() {
  cd "Kara-${_pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
# vim:set ts=2 sw=2 et:
