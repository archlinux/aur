
pkgname=git-radar-git
_pkgname=git-radar
pkgver=r236.fe17db8
pkgrel=1
pkgdesc='A heads up display for git'
arch=('x86_64' 'i686')
url='https://github.com/michaeldfallen/git-radar'
license=('MIT')
depends=()
source=("git://github.com/michaeldfallen/git-radar.git")
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
    cd $srcdir/$_pkgname

    install -dm755 $pkgdir/opt/$_pkgname
    cp -a $srcdir/$_pkgname/. $pkgdir/opt/$_pkgname
    install -dm755 $pkgdir/usr/bin
    ln -s /opt/$_pkgname/git-radar $pkgdir/usr/bin/git-radar
}

