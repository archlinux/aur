# Maintainer: Maxime Bailleul <mexx.bailleul at gmail dot com>
pkgname='steamy_cats-git'
_pkgname='steamy_cats'
pkgver=v.2.r29.g4cdb8d2
pkgrel=1
pkgdesc='A Steam game category sorter written in Bash'
arch=('any')
url='https://github.com/bryanmr/Steamy_Cats'
license=('GPL3')
depends=('jq')
makedepends=('git')
provides=('steamy_cats')
_gitname='Steamy_Cats'
source=('git+https://github.com/bryanmr/Steamy_Cats.git')
sha256sums=('SKIP')

pkgver() {
    cd $srcdir/${_gitname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd $srcdir/${_gitname}
    install -m755 -D "Steamy_Cats" "$pkgdir/usr/bin/steamy_cats"
}