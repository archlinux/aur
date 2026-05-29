# Maintainer: j4y <j4y_w4lk3r@pobox.com>
#
# rui-bin — terminal UI for managing home routers (Orange Livebox/Funbox today;
# Play/Fritz on the roadmap).
#
# This PKGBUILD is auto-maintained by goreleaser on every git tag of
# https://github.com/j4y-w4lk3r/rui — see that repo's .goreleaser.yaml
# (`aurs:` block) and .github/workflows/release.yml for the bump
# pipeline.
#
# Reproducing manually:
#   1. wait for a new release at github.com/j4y-w4lk3r/rui/releases
#   2. update pkgver, sha256sums, regenerate .SRCINFO with `makepkg --printsrcinfo`
#   3. git commit -am "rui-bin: bump to vX.Y.Z" && git push

pkgname=rui-bin
_pkgname=rui
pkgver=0.1.1
pkgrel=1
pkgdesc="Terminal UI for managing home routers (Orange Livebox/Funbox today; Play/Fritz on the roadmap)"
arch=('x86_64')
url="https://github.com/j4y-w4lk3r/rui"
license=('MIT')
depends=('glibc')
optdepends=(
    'chromium: --capture mode (records router web UI traffic) needs a Chrome/Chromium binary'
    'xdg-utils: ergonomic clipboard support for `y`/`Y` device-copy keys'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("${_pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('b3d4ba897d4603141e601374ec886386effcd40b40554fdfc798083799f8edc9')

package() {
    install -Dm755 "${srcdir}/${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
