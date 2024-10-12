# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

pkgname=tmlshock-bin
_pkgname=${pkgname%-bin}
pkgver=1.3.0
pkgrel=5
pkgdesc="A terminal ttl clock and stopwatch build by golang"
arch=('x86_64')
url="https://github.com/yorukot/tmlshock"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=()
optdepends=()
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/yorukot/tmlshock/v${pkgver}/LICENSE"
        "README-${pkgver}::https://raw.githubusercontent.com/yorukot/tmlshock/v${pkgver}/README.md")
source_x86_64=("${_pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/${_pkgname}")
sha256sums=('5da911b05588598fe7d1b504fa3afeee20af08bf3f1fe3c3518d54da0f3769d6'
            'd2bd04599fde072198a7acbe3d16afeec0cabc6ee01309055ea59e0bf7fcb46d')
sha256sums_x86_64=('52dd07e19cf0e2dfc59c3c6cb414bffe443b7bd7fea70f02d96d1d833fd5b10a')

package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README-${pkgver}" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
