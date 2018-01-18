# Maintainer: Alex Sarum <rum.274.4 at gmail dot com>

pkgname='python2-bleah-git'
pkgver='0.1'
pkgrel=1
pkgdesc="A BLE scanner for 'smart' devices hacking based on the bluepy library, dead easy to use because retarded devices should be dead easy to hack."
arch=('any')
url='https://github.com/evilsocket/bleah'
license=('GPL')
depends=('python2' 'python2-bluepy' 'python2-terminaltables')
makedepends=('git' 'python2' 'python2-setuptools')
conflicts=()
source=("${pkgname}::git+https://github.com/evilsocket/bleah")
md5sums=('SKIP')


package() {
    cd "${srcdir}/${pkgname}"

    find . -name "*.py" -exec sed -i 's#/usr/bin/env python#/usr/bin/env python2#' {} \;

    # Install python packages to $pkgdir
    python2 setup.py install --root ${pkgdir}
}