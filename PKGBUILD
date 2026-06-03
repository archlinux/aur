pkgname=python-cron-descriptor
pkgver=2.1.0
pkgdesc="A Python library that converts cron expressions into human readable strings."
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('c0588c5f49fd132747047a6c93d3ddb523359ec7dc10f27abe341a04446b6255')
makedepends=('python-setuptools')
depends=(
    'python'
    'python-typing_extensions'
)

prepare() {
  mkdir -p "${srcdir}/${pkgname}"
  cp -R "${srcdir}/cron-descriptor-${pkgver}/cron_descriptor" "${srcdir}/${pkgname}"
  cp -R "${srcdir}/cron-descriptor-${pkgver}/tests" "${srcdir}/${pkgname}"
  cp -R "${srcdir}/cron-descriptor-${pkgver}/setup.py" "${srcdir}/${pkgname}"
  cp -R "${srcdir}/cron-descriptor-${pkgver}/README.md" "${srcdir}/${pkgname}"
}

package() {
  cd "${srcdir}/cron-descriptor-${pkgver}"
  echo $PWD
  python setup.py install --root="$pkgdir/" --optimize=1
}
