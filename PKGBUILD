# Maintainer: Fredy García
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Dino Krtanjek <krtanjekdino@gmail.com>

pkgname=python2-iniparse
pkgver=0.4
pkgrel=4
pkgdesc="Better INI parser library for Python"
arch=("any")
license=("MIT")
url="https://code.google.com/archive/p/${pkgname#python2-}"
depends=("python2")
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/${pkgname#python2-}/${pkgname#python2-}-${pkgver}.tar.gz")
sha256sums=("abc1ee12d2cfb2506109072d6c21e40b6c75a3fe90a9c924327d80bc0d99c054")

build() {
  cd "${srcdir}/${pkgname#python2-}-${pkgver}"
  python2 ./setup.py build
}

package() {
  cd "${srcdir}/${pkgname#python2-}-${pkgver}"
  python2 ./setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
