# Maintainer: Lukasz Michalski <lm@zork.pl>

pkgname=check_docker_container
pkgver=1.0.3
pkgrel=1
pkgdesc="Nagios / Icinga monitoring plugin to check if docker container is running"
arch=('any')
url="https://github.com/BlackZork/check_docker_container.git"
license=('MIT')
depends=('python-nagiosplugin')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/BlackZork/check_docker_container.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build --install-scripts=/usr/lib/monitoring-plugins/
}
