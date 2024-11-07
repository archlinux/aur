# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgbase='python-asgi-lifespan'
pkgname=('python-asgi-lifespan')
pkgver=2.1.0
pkgrel=4
pkgdesc='Programmatic startup/shutdown of ASGI apps.'
arch=('any')
url='https://github.com/florimondmanca/asgi-lifespan'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/a/asgi-lifespan/asgi-lifespan-$pkgver.tar.gz")
sha256sums=('5e2effaf0bfe39829cf2d64e7ecc47c7d86d676a6599f7afba378c31f5e3a308')
provides=("python-asgi-lifespan=$pkgver")
depends=('python>=3.7.0' 'python-sniffio')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-wheel')
#checkdepends=('python-attrs>=19.2' 'python-autoflake' 'python-black==23.3.' 'python-exceptiongroup' 'mypy==1.3.0' 'python-pytest==7.' 'python-pytest-asyncio==0.18.' 'python-pytest-cov' 'python-pytest-trio==0.8.' 'python-ruff==0.0.270' 'python-starlette==0.27.' 'python-trio==0.22.' 'python-httpx==0.24.*')
#optdepends=('twine')


build() {
  cd "${srcdir}"/asgi-lifespan-$pkgver
  python setup.py build
} 

package_python-asgi-lifespan() {
  cd "${srcdir}"/asgi-lifespan-$pkgver
  python setup.py install --root="${pkgdir}" --optimize=1
}
