# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/dummy.aur.package-git

pkgname=package-git
_pkgname=dummy.releases
pkgver=v0.1.4.r1.gaca1320
pkgrel=1
pkgdesc="Dummy package used to exercise the aur-workflow CI/publish pipeline (tracks git commits)"
arch=('any')
url="https://github.com/its-me/dummy.releases"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/its-me/dummy.releases")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$_pkgname"
    install -Dm644 activity.log "${pkgdir}/usr/share/doc/${pkgname}/activity.log"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
