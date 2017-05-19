# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=ansible-cmdb
pkgver=1.21
pkgrel=1
pkgdesc=" Generate host overview from ansible fact gathering output"
arch=('any')
url="https://github.com/fboender/ansible-cmdb"
license=('GPL3')
depends=('python2' 'ansible' 'python2-mako' 'python2-ushlex' 'python2-jsonxs')
source=("https://github.com/fboender/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('2597746718a9652956c2427e3a251ade9e5bf39aa84e443b08ca2fc4feaf61417b2afd2ae6eef087784f920aa9ec7f5867cb75fb07075c4fd3c8f429323d221c')

build() {
    cd $srcdir/${pkgname}-${pkgver}
    python2 setup.py build
}

package() {
    cd $srcdir/${pkgname}-${pkgver}
    python2 setup.py install --root="$pkgdir" --optimize=1
}

