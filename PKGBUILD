pkgname=python-alerta-client
_pkgvergit=commit=8c80312359d1c5f078f56dbe3ae6810dec04617f
pkgver=4.8.3
pkgrel=1
arch=('any')
url=https://github.com/alerta/python-alerta-client
license=('MIT')
depends=('python' 'python-requests' 'python-pytz' 'python-setuptools')
#makedepends=('python-setuptools')
source=("git+https://github.com/alerta/python-alerta-client.git#$_pkgvergit")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  cat VERSION
}

prepare() {
    cd $srcdir/$pkgname/
    echo -e "22d21\n<         'argparse'," | patch setup.py
}

# build() {
#     mkdir -p $pkgdir/usr/lib/python3.5/site-packages
# }

package() {
    #mkdir -p $pkgdir/usr/lib/python3.5/site-packages
    cd $srcdir/$pkgname/
    python setup.py install --root $pkgdir
}
