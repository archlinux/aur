# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=3.1
pkgrel=3
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-django' 'python-rq' 'python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-django' 'python-rq')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('6d4fd80cd05148ca2aa27714bc793f6c281a1c515457b95c8341cee4cbf499aa265d30cf52c690266471c87b2eebbf5777c4ed5b4f541db8ca22a926b6c4ed35')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	python -m build --wheel --no-isolation
}

package_python-django-rq() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
