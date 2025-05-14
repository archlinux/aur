# Maintainer: mbutsk <mbutsk@icloud.com>
# Contributer: n0n1m

pkgname=pyhoster
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple tool for servers that host python projects"
arch=('any')
url="https://github.com/mbutsk/pyhoster"
license=('MIT')
depends=(python3)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('4f7fa4ea9c3ed71a1d8b1ce540a8a3c617ce797a80e4d0f192d04aab48a59d34')
conflicts=(pyhoster-git)

package() {
    install -D $pkgname-$pkgver/pyhoster.8 -t $pkgdir/usr/share/man/man8
    cp -r $pkgname-$pkgver/pyhoster $pkgdir/usr/share
    chmod +x $pkgdir/usr/share/pyhoster/main.py
    mkdir -p $pkgdir/usr/bin
    ln -s /usr/share/pyhoster/main.py $pkgdir/usr/bin/pyhoster
}