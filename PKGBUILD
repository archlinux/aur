# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantwelcome
pkgname=$_pkgname
pkgver=202007231802
pkgrel=1
pkgdesc="welcome app instantOS"
url="https://github.com/instantOS/instantWELCOME"
arch=('any')
license=('MIT')
depends=('bash' 'instantmenu')
makedepends=('git')
provides=(instantwelcome)
conflicts=(instantwelcome)
source=("$_pkgname::git+https://github.com/instantOS/instantwelcome.git")

sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    echo "$(date '+%Y%m%d%H%M')"
}

prepare() {
    cd $_pkgname
    echo "no prepare"
}

build() {
    cd $_pkgname
    echo "no build"
}

package() {
    cd $_pkgname
    mkdir -p ${pkgdir}/usr/bin

    mkdir -p "$pkgdir/usr/share/applications/"
    chmod 644 *.desktop
    mv *.desktop "$pkgdir/usr/share/applications/"

    chmod +x *.sh
    mv instantwelcome.sh ${pkgdir}/usr/bin/instantwelcome
}
