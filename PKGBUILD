# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=3.2.1
pkgrel=2
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-django' 'python-rq' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-redis')
depends=('python' 'python-django' 'python-rq' 'python-hatchling' 'python-redis')
optdepends=('python-prometheus_client')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('9f68383bb0736cde2c1b572a7caaba0d15e04269f826e206db47982576a36d59a4ead1ce17c926d8b43eeaf03bdfd09e68bc011afb42aacc562c889bde006bdf')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	python -m build --wheel --no-isolation
}

package_python-django-rq() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
