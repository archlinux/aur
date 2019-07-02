# Maintainer: Valerii Huz <ghotrix@gmail.com>
pkgname=python2-pyaudio
pkgver=0.2.11
pkgrel=3
pkgdesc="Python bindings for PortAudio"
arch=("any")
url="https://pypi.org/project/PyAudio"
license=("MIT")
depends=("python2")
makedepends=("python2-setuptools" "portaudio")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://files.pythonhosted.org/packages/ab/42/b4f04721c5c5bfc196ce156b3c768998ef8c0ae3654ed29ea5020c749a6b/PyAudio-$pkgver.tar.gz")
sha256sums=("93bfde30e0b64e63a46f2fd77e85c41fd51182a4a3413d9edfaf9ffaa26efb74")

build() {
  cd "${srcdir}/PyAudio-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/PyAudio-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
