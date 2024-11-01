# Maintainer: PhrozenByte <cron-notify at daniel-rudolf dot de>

pkgname=cron-notify
pkgver=1.0.6
pkgrel=1
pkgdesc="FreeDesktop.org-compatible notification service to periodically ask for acknowledgement before executing a cronjob"
url='https://github.com/PhrozenByte/cron-notify'
license=('GPL-3.0-only')
arch=('any')
depends=('dbus' 'python' 'python-croniter' 'python-notify2' 'python-gobject' 'python-pyxdg')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1cc6cf681108384ac6ebbc8f093d376477d2ca7338e25dbef3df019de9573e0a')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
