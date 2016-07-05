# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=gplaycli
pkgver=0.1.2
pkgrel=2
pkgdesc="command line tool to search/install/update Android applications Google PlayStore able to run with cronjob, in order to automatically update an F-Droid server instance"
arch=('any')
url="https://github.com/matlink/gplaycli"
license=('AGPL')
depends=('python2' "python2-requests" "python2-protobuf")
optdepends=('java-runtime: needed for autogeneration of a new AndroiID')
source=("$pkgname-$pkgver.tar.gz::https://github.com/matlink/gplaycli/archive/${pkgver}.tar.gz")
md5sums=('36c589d083ebf931b1af8538ef37d072')

package() {
    cd gplaycli-$pkgver
    find . -name "*.py" -exec sed -i 's$#!/usr/bin/python$#!/usr/bin/python2$' {} \;
    find . -name "*.py" -exec sed -i 's$#!/usr/bin/env python$#!/usr/bin/env python2$' {} \;
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
