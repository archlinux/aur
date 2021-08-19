# Maintainer: Aleksandr Beliaev <trap000d@gmail.com>

pkgname=python-wsgidav-seafile
pkgver=8.0.7
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
sha256sums=('71d33d3843ba784c69d9e82c4cf383153f12486b5b98367c4d58915c7f22d521')

package() {
    cd "$srcdir/seafdav-$pkgver-server"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
