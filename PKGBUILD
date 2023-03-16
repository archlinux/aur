# Maintainer: Oleg Hahm <oleg+aur@riot-os.org>
_pkgname="bash-script-wttr"
pkgname=wttr-git
pkgver=1.55
pkgrel=2
pkgdesc="A simple script that helps you check weather condition using site: http://wttr.in (new repository version)"
arch=('any')
url="https://github.com/cblte/${_pkgname}"
license=('MIT')
makedepends=('git')
provides=("wttr=${pkgver}")
conflicts=("wttr")
depends=('curl')
source=("git+https://github.com/cblte/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname} 
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    mkdir -p ${pkgdir}/usr/bin/
        cd "${_pkgname}"
        install -Dm0755 "wttr" ${pkgdir}/usr/bin/wttr
        install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
