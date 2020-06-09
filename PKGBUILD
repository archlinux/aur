# Maintainer: paperbenni <paperbenni@gmail.com>
_pkgname=instantsettings
pkgname=$_pkgname
pkgver=202004291911
pkgrel=1
pkgdesc="simple settings app for instantOS"
url="https://github.com/instantOS/instantsettings"
arch=('any')
license=('MIT')
depends=('python' 'gtk3')
makedepends=('git')
provides=(instantsettings)
conflicts=(instantsettings)
source=("$_pkgname::git+https://github.com/instantOS/instantsettings.git")

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

    mkdir -p "$pkgdir/usr/share/applications/"
    mv ./*.desktop "$pkgdir/usr/share/applications/"

    mkdir -p "${pkgdir}"/usr/share/instantsettings
    mkdir -p "${pkgdir}"/usr/bin
    mv mainsettings.py ${pkgdir}/usr/bin/instantsettings
    chmod 755 "${pkgdir}"/usr/bin/instantsettings
    mv ./* "${pkgdir}"/usr/share/instantsettings/
    ln -s /usr/bin/instantsettings ${pkgdir}/usr/bin/instantos-control-center
}
