# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

pkgbase=django-rq
pkgname=('python-django-rq')
pkgver=3.2.2
pkgrel=1
pkgdesc="A simple app that provides django integration for RQ (Redis Queue)"
arch=('any')
license=('MIT')
url="https://github.com/ui/django-rq"
makedepends=('python' 'python-django' 'python-rq' 'python-build' 'python-installer' 'python-wheel' 'python-hatchling' 'python-redis')
depends=('python' 'python-django' 'python-rq' 'python-hatchling' 'python-redis')
optdepends=('python-prometheus_client')
source=("django-rq-${pkgver}.tar.gz::https://github.com/ui/django-rq/archive/v${pkgver}.tar.gz")
sha512sums=('538ffec0dde802eda77936bf0b3ed40d384947c1d3f9176415ef2a393ece66f9532ebc9e960d46f10554e212fe28a4d532e94a367a078d19ddfcd00689bcc582')

build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	python -m build --wheel --no-isolation
}

package_python-django-rq() {
  cd "${srcdir}/${pkgbase}-${pkgver}"

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
