# Maintainer: Sergey Kanafyev <sergeykanafyev@gmail.com>
# Automation: https://github.com/its-me/dummy.aur.package

pkgname=package
_pkgname=dummy.releases
pkgver=0.1.4
pkgrel=1
pkgdesc="Dummy package used to exercise the aur-workflow CI/publish pipeline (tracks tagged releases)"
arch=('any')
url="https://github.com/its-me/dummy.releases"
license=('MIT')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/its-me/dummy.releases/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('01a1081ae0038e61003b72e654d6ef9ac9db6884f347daa458329f5affa177c0')

package() {
    cd "${_pkgname}-${pkgver}"
    install -Dm644 activity.log "${pkgdir}/usr/share/doc/${pkgname}/activity.log"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
