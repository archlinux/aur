# Maintainer: mbutsk <mbutsk@icloud.com>
# Contributer: n0n1m

pkgname=pyhoster
pkgver=1.0.3
pkgrel=1
pkgdesc="A simple tool for servers that host python projects"
arch=('any')
url="https://github.com/mbutsk/pyhoster"
license=('MIT')
depends=(python3 python-psutil)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('09db1e1e6d2effefe08adac21018d4096d026c1cef779bc673eb583ca87f15cb')
conflicts=(pyhoster-git)

package() {
    install -D $pkgname-$pkgver/pyhoster.8 -t $pkgdir/usr/share/man/man8
    cp -r $pkgname-$pkgver/pyhoster $pkgdir/usr/share
    chmod +x $pkgdir/usr/share/pyhoster/main.py
    mkdir -p $pkgdir/usr/bin
    ln -s /usr/share/pyhoster/main.py $pkgdir/usr/bin/pyhoster
}