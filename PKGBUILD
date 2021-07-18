_pkgname=python-uvicorn-loguru-integration
pkgname="${_pkgname}-git"
pkgver=r4.89403d8
pkgrel=1
pkgdesc='Code to integrate uvicorn.run with Loguru logging'
arch=('any')
url='https://github.com/MatthewScholefield/uvicorn-loguru-integration'
license=('MIT')
depends=('uvicorn' 'python-loguru-logging-intercept')
makedepends=('python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/uvicorn-loguru-integration"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/uvicorn-loguru-integration"
  python setup.py install --root="$pkgdir" --optimize=1
}
