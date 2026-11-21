pkgname=python-cron-descriptor
pkgver=2.3.5
pkgdesc="A Python library that converts cron expressions into human readable strings."
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('6ba645c5a1d93bf7068f76ff06a93b01fba0c11613770a8de2e63a531918172b')
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
