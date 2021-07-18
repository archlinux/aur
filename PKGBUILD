_pkgname=python-loguru-logging-intercept
pkgname="${_pkgname}-git"
pkgver=r4.fa3a0fa
pkgrel=1
pkgdesc='Code to integrate uvicorn.run with Loguru logging'
arch=('any')
url='https://github.com/MatthewScholefield/loguru-logging-intercept'
license=('MIT')
depends=('python-loguru')
makedepends=('python-setuptools')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$url.git")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/loguru-logging-intercept"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/loguru-logging-intercept"
  python setup.py install --root="$pkgdir" --optimize=1
}
