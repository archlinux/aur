# Maintainer: Lukasz Michalski <lm@zork.pl>

pkgname=check_systemd
pkgver=2.3.1
pkgrel=1
pkgdesc="Nagios / Icinga monitoring plugin to check systemd for failed units"
arch=('any')
url="https://github.com/Josef-Friedrich/check_systemd"
license=('LGPL2')
depends=('python-nagiosplugin')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/Josef-Friedrich/check_systemd.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build --install-scripts=/usr/lib/monitoring-plugins/
}
