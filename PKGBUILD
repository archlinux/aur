# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantwelcome
pkgname=$_pkgname
pkgver=20202610d52be7a
pkgrel=1
pkgdesc="welcome app instantOS"
url="https://github.com/instantOS/instantWELCOME"
arch=('any')
license=('MIT')
depends=('python' 'gtk3')
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
    mkdir -p ${pkgdir}/usr/share/instantwelcome

    mkdir -p "$pkgdir/usr/share/applications/"
    chmod 644 *.desktop
    mv *.desktop "$pkgdir/usr/share/applications/"

    chmod +x *.py
    chmod +x *.sh
    mv welcome.sh ${pkgdir}/usr/bin/instantwelcome
    mv welcome.py ${pkgdir}/usr/share/instantwelcome/
    mv welcome.glade ${pkgdir}/usr/share/instantwelcome/
}
