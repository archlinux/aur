pkgname=python-cron-descriptor
pkgver=2.2.1
pkgdesc="A Python library that converts cron expressions into human readable strings."
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('5d180d7f597603b7517c870266ab91701626b304c0a389a682186a337a2b67da')
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
