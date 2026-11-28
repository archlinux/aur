# Maintainer: novica <nnovica@gmail.com>

pkgname=raven-bin
pkgver=0.24.0 # renovate: datasource=github-releases depName=jbearak/raven
pkgrel=1
pkgdesc="Static analyzer for R — a language server in your editor, a checker in CI"
arch=('x86_64' 'aarch64')
url="https://github.com/jbearak/raven"
license=('GPL-3.0-only')
depends=('glibc')
conflicts=('raven')
options=('!debug')
provides_x86_64=("raven=${pkgver}")
provides_aarch64=("raven=${pkgver}")
source_x86_64=("${pkgname}-${pkgver}-x86_64.zip::https://github.com/jbearak/raven/releases/download/v${pkgver}/raven-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}-aarch64.zip::https://github.com/jbearak/raven/releases/download/v${pkgver}/raven-linux-arm64.zip")

package() {
    cd "$srcdir"

    install -Dm755 raven "$pkgdir/usr/bin/raven"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

sha256sums_x86_64=('51a19125e2bcf2d9745367b282909b82524ac0d100b32e870ddd154857e372a4')
sha256sums_aarch64=('844baef7c9c0d6bafef0db32842140abc32027b548b9d2a9f456e1283511c8fe')
