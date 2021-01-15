# Maintainer: Jerry <isjerryxiao at outlook dot com>
_srcname=pacroller
pkgname=pacroller
pkgver=0.0.1
pkgrel=2
pkgdesc="Unattended upgrade for archlinux"
arch=('any')
url="https://github.com/isjerryxiao/pacroller"
license=('GPL3')
depends=('python' 'pyalpm')
makedepends=('git')
backup=('etc/pacroller/config.json')
source=("$_srcname::git+https://github.com/isjerryxiao/pacroller#tag=${pkgver}")
md5sums=('SKIP')

package() {
    cd "$srcdir/$_srcname"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "src/$_srcname/config.json.example" "$pkgdir/etc/pacroller/config.json"
    mkdir -p "$pkgdir/var/lib/pacroller"
}
