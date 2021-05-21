# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=python-wsgidav-seafile
pkgver=8.0.5
pkgrel=1
pkgdesc="Seafile webdav server"
arch=('any')
url="https://github.com/haiwen/seafdav"
license=('MIT')
depends=('python'
         'python-json5'
         'python-seafobj'
         'python-defusedxml'
         'python-jinja'
         'python-sqlalchemy'
         'python-yaml')
makedepends=('python-setuptools'
             'libyaml')
conflicts=('python-wsgidav')
source=("${url}/archive/v${pkgver}-server.tar.gz")
sha256sums=('6cb27d0a4425775cb7c888eb7eb2173446aab397bc86b30fef72ebe19f3c0a28')

package() {
    cd "$srcdir/seafdav-$pkgver-server"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
