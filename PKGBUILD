# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jason van Gumster <fweeb@monsterjavaguns.com>

pkgname=python-rq-scheduler
pkgver=0.10.0
pkgrel=1
pkgdesc="Small package that adds job scheduling capabilities to RQ"
arch=('any')
license=('MIT')
url="https://github.com/rq/rq-scheduler"
makedepends=('python-setuptools')
depends=('python-rq>=0.13' 'python-croniter>=0.3.9' 'python-dateutil')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('746a3496f4091df24fd749f2000d2aa0ba9b7ebd2652e5483c497faa82550d0f')

build() {
	cd "rq-scheduler-$pkgver"
	python setup.py build
}

package() {
	cd "rq-scheduler-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
