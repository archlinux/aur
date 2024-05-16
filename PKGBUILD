# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=python-wsgidav-seafile
pkgver=11.0.8
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
         'python-setuptools'
         'python-sqlalchemy'
         'python-yaml')

makedepends=('python-pip'
             'libyaml')

conflicts=('python-wsgidav')
source=("${url}/archive/v${pkgver}-server.tar.gz")
sha256sums=('7cec9e93d331a515d1f2c614c061789f01c69dbbe21c62a5d99ff16dcd085fbc')

package() {
    cd "$srcdir/seafdav-$pkgver-server"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
