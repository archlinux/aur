pkgname=zabbix-cli-git
pkgver=1.7
pkgrel=1
pkgdesc="Command-line interface for the Zabbix monitoring system"
arch=(any)
url="https://github.com/usit-gd/zabbix-cli"
license=(GPL3)
depends=('python2-argparse' 'python2-requests' 'python2-ipaddr')
makedepends=('python2-setuptools')
optdepends=()
source=(git+https://github.com/usit-gd/zabbix-cli.git)
sha256sums=('SKIP')

build() {
    cd "$srcdir/${pkgname%-git}"
    python2 setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
