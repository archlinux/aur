# Maintainer: Lukasz Michalski <lm@zork.pl>

pkgname=nagios-check-hddtemp
pkgver=1.4.10
pkgrel=2
pkgdesc="A python plugin that allows Nagios/Icinga2 to monitor hdd temperatures using hddtemp in server mode"
arch=('any')
url="https://github.com/vint21h/nagios-check-hddtemp"
license=('GPLv3')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/vint21h/nagios-check-hddtemp.git#tag=$pkgver")
sha256sums=('SKIP')

build() {
    cd "$srcdir/nagios-check-hddtemp"
    python setup.py build
}

package() {
    cd "$srcdir/nagios-check-hddtemp"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build --skip-build --install-scripts=/usr/lib/monitoring-plugins/
    mv ${pkgdir}/usr/lib/monitoring-plugins/check_hddtemp.py ${pkgdir}/usr/lib/monitoring-plugins/check_hddtemp
}
