# Maintainer, contributor  Bruno R. <bruno (at) mailoo (dot) org>


_realname=lunela-master
pkgname=lunela
pkgver=1.2
pkgrel=1
pkgdesc="Print ephemeris of the moon in a terminal"
arch=('any')
url="https://gitlab.com/brunoy/lunela.git"
license=('GPL3')
depends=('python>=3.6')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/brunoy/$pkgname/-/archive/master/$_realname.tar.gz")
md5sums=('SKIP')


package() {

    cd "$srcdir/$_realname"

    install -d "$pkgdir/usr/bin/"
    install -d "$pkgdir/usr/share/$pkgname/moon/"
    install -d "$pkgdir/usr/share/$pkgname/image/"
    install -d "$pkgdir/usr/share/$pkgname/locale/fr/LC_MESSAGES/"

    install -m755 "$srcdir/$_realname/bin/$pkgname" "$pkgdir/usr/bin/"
    install -m644 "$srcdir/$_realname/src/moon/"*.py "$pkgdir/usr/share/$pkgname/moon/"
    install -m644 "$srcdir/$_realname/src/locale/fr/LC_MESSAGES/lunela.mo"\
                  "$pkgdir/usr/share/$pkgname/locale/fr/LC_MESSAGES/"
    install -m644 "$srcdir/$_realname/src/image/"*.jpg "$pkgdir/usr/share/$pkgname/image/"
    install -m644 "$srcdir/$_realname/src/"{main.py,ALIRE.txt} "$pkgdir/usr/share/$pkgname/"
}

