pkgname=python-cron-descriptor
pkgver=1.4.4
pkgdesc="A Python library that converts cron expressions into human readable strings."
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('b0831b9035252c0e971565b88daddf108807ab312fbed2a0fedda41e53fd8c4c')
makedepends=('python-setuptools')
depends=(
    'python'
)

# prepare() {
#   mkdir -p "${srcdir}/${pkgname}"
#   cp -R "${srcdir}/../../cron_descriptor" "${srcdir}/${pkgname}"
#   cp -R "${srcdir}/../../tests" "${srcdir}/${pkgname}"
#   cp -R "${srcdir}/../../setup.py" "${srcdir}/${pkgname}"
#   cp -R "${srcdir}/../../README.md" "${srcdir}/${pkgname}"
# }

package() {
  cd "${srcdir}/cron-descriptor-${pkgver}"
  echo $PWD
  python setup.py install --root="$pkgdir/" --optimize=1
}
