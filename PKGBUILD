# Maintainer: Bernardo Gameiro <projects@bgameiro.me>

pkgbase='python-asgi-lifespan'
pkgname=('python-asgi-lifespan')
pkgver=2.1.0
pkgrel=2
pkgdesc='Programmatic startup/shutdown of ASGI apps.'
arch=('any')
url='https://github.com/florimondmanca/asgi-lifespan'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/a/asgi-lifespan/asgi-lifespan-$pkgver.tar.gz")
sha256sums=('5e2effaf0bfe39829cf2d64e7ecc47c7d86d676a6599f7afba378c31f5e3a308')
provides=("python-asgi-lifespan=$pkgver")

build() {
  cd "${srcdir}"/asgi-lifespan-$pkgver
  python setup.py build
} 

package_python-asgi-lifespan() {
  depends=(
         'python>=3.7.0'
         )

  cd "${srcdir}"/asgi-lifespan-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}