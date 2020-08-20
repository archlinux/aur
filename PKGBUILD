# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=gdcsd-git
pkgver=r8.bd59fad
pkgrel=1
pkgdesc="Geometry Dash Custom Song Downloader, a CLI audio downloader from Newgrounds to Geometry Dash"
arch=('any')
url="https://github.com/SamLukeYes/GDCSD"
license=('GPL3')
makedepends=('git')
depends=('python' 'aria2')
optdepends=()
provides=('gdcsd')
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
    cd ${srcdir}/GDCSD
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/GDCSD
    install -d ${pkgdir}/usr/bin
    install -m755 gdcsd.py ${pkgdir}/usr/bin/gdcsd
}