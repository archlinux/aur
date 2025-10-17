pkgname=python-cron-descriptor
pkgver=2.0.6
pkgdesc="A Python library that converts cron expressions into human readable strings."
pkgrel=1
arch=('any')
license=('MIT')
url='https://github.com/Salamek/cron-descriptor'
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('e89864b45eafae7d587701d8373bc6b0aaf8d1111257937877f8fd37e9fbcb2a')
makedepends=('python-setuptools')
depends=(
    'python'
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
