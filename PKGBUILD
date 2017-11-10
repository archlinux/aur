# Maintainer: Bernhard Landauer <oberon@manjaro.org>

_pkgname=roguehostapd
pkgname=$_pkgname-git
pkgver=1.0.r14.g375e3ea
pkgrel=1
pkgdesc="Hostapd Python wrapper to simplify usage of hostapd"
url="https://github.com/wifiphisher/$_pkgname"
arch=('any')
license=('BSD 3')
depends=('python2')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $_pkgname
    python2 setup.py install --root=$pkgdir --optimize=1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
