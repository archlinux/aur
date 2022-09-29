# Maintainer: Klotz <vanziegelstein@gmail.com>
pkgname=baudrate
pkgver=r9.68b7eef
pkgrel=1
pkgdesc="Tool to find the baudrate of a serial device (Python 3 fork)."
arch=('any')
url="https://github.com/sickcodes/python3-baudrate"
license=('MIT')
depends=('python-pyserial' 'python-getch')
replaces=('baudrate=1.0-2')
source=("baudrate::git+https://github.com/sickcodes/python3-baudrate")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "$pkgdir/usr/share/licenses/$pkgname"    
    install -d "$pkgdir/usr/bin"    

    install -m755 "$srcdir/$pkgname/baudrate.py" "$pkgdir/usr/bin/baudrate"
    install -m644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
