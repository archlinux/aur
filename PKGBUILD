# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=4.1
pkgrel=1
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-django' 'python-rq' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-redis')
depends=('python' 'python-django' 'python-rq' 'python-hatchling' 'python-redis')
optdepends=('python-prometheus_client')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('fbb640ac2d28a74642979cdab4af1e6dc9ff6f839b68c453e17938a690f41c947f930ee384a92f028b96d5b9d1941537424eb9464c34ca443d8da78136e09437')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	python -m build --wheel --no-isolation
}

package_python-django-rq() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
