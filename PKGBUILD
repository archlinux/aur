# Maintainer: Amirreza Firoozi <firoozi128.af@gmail.com>
# Maintainer: Oleg Hahm <oleg+aur@riot-os.org>
_pkgname="bash-script-wttr"
pkgname=wttr
pkgver=1.55
pkgrel=2
epoch=
pkgdesc="a simple script that checks the weather condition via http://wttr.in"
arch=('any')
url="https://github.com/cblte/${_pkgname}"
license=('MIT')
makedepends=('git')
provides=("wttr=${pkgver}")
conflicts=("wttr")
depends=('curl')
source=("git+https://github.com/cblte/${_pkgname}")
install=$pkgname.install
md5sums=('SKIP')
changelog=
noextract=()

pkgver() {
  cd ${_pkgname}
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    mkdir -p ${pkgdir}/usr/bin/
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
        cd "${_pkgname}"
            install -Dm0755 "wttr" ${pkgdir}/usr/bin/wttr
            install -Dm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

