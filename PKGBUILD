# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=pkgbuild-watch
pkgver=20120622
pkgrel=1
pkgdesc="Monitor upstream for updates."
url="http://kmkeen.com/pkgbuild-watch"
license=("GPL")
arch=('any')
makedepends=('git')
depends=('bash' 'curl' 'html2text' 'expac')
source=('git+https://github.com/keenerd/pkgbuild-watch')
md5sums=('SKIP')

_gitname='pkgbuild-watch'

pkgver() {
    cd "$srcdir/$_gitname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {      
    cd "$srcdir/$_gitname"
    install -Dm 755 pkgbuild-watch "$pkgdir/usr/bin/pkgbuild-watch"
    install -Dm 755 urlwatch.sh    "$pkgdir/usr/bin/urlwatch.sh"
}

