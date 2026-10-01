# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=4.2
pkgrel=1
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-django' 'python-rq' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-redis')
depends=('python' 'python-django' 'python-rq' 'python-hatchling' 'python-redis')
optdepends=('python-prometheus_client')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('c82ccd04d180b0a2ff5581c194fa5262cc2b479fdba2a8cddc9b4ef82e2722757518dda3541df1ce12594200a989bb4052f7bc6b412d4d754b67e52c5810db68')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	python -m build --wheel --no-isolation
}

package_python-django-rq() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
