# Maintainer: cyka3702 <swc.rainier@gmail.com>
# Contributor: paperbenni <paperbenni@gmail.com>
pkgname=instantassist
echo package name $pkgname
_pkgname=instantassist
pkgver=202006050952
pkgrel=1
pkgdesc="a bunch of shortcuts for instantOS"
url="https://github.com/instantos/instantassist"
arch=('any')
license=('MIT')
options=(zipman)
depends=('bash' 'instantmenu')
makedepends=('git')
provides=('instantassist')

source=("$_pkgname::git+https://github.com/instantOS/instantASSIST.git")
md5sums=("SKIP")

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    echo "no prep"
}

build() {
    echo "no build"
}

package() {
    cd $_pkgname
    mkdir -p "$pkgdir/usr/share/applications/"
    chmod 644 *.desktop
    mv *.desktop "$pkgdir/usr/share/applications/"
    export ASSISTPREFIX="$pkgdir"
    echo "$pkgdir"
    ./install.sh
}
