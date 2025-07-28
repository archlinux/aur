# Maintainer: LightDot <lightdot -a-t- server.si>

pkgname=rdapcheck
pkgver=0.1.1
pkgrel=1
pkgdesc="A simple RDAP library and command-line tool to check domain name availability in bulk."
arch=('x86_64' 'aarch64')
url="https://github.com/Gadiguibou/rdapcheck"
license=('AGPL-3.0')
makedepends=('deno')
options=('!strip')
provides=('rdapcheck')
conflicts=('rdapcheck')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c636b18a800ce078da5f564c97f2151d117d4aa1afda681f984563a2034c3824')

build() {
    cd "${pkgname}-${pkgver}"
    deno compile -o "${pkgname}" --allow-net src/cmd.ts
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
