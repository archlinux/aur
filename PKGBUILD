# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=ansible-cmdb
pkgver=1.19
pkgrel=1
pkgdesc=" Generate host overview from ansible fact gathering output"
arch=('any')
url="https://github.com/fboender/ansible-cmdb"
license=('GPL3')
depends=('python2' 'ansible' 'python2-mako' 'python2-ushlex' 'python2-jsonxs')
source=("https://github.com/fboender/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('296d97817c175c8ddfe7cf5e3be9cbc621d2af5ff08d8ed0009f7298e5e2422030a279bed8e71e54dd87a94ccd2c772a09d6538e54329af2d0009cb31c37aeb3')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}

