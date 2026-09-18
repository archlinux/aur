# Maintainer: novica <nnovica@gmail.com>

pkgname=raven-bin
pkgver=0.21.1 # renovate: datasource=github-tags depName=jbearak/raven
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
source_x86_64=("${pkgname}-${pkgver}.zip::https://github.com/jbearak/raven/releases/download/v${pkgver}/raven-linux-x64.zip")
source_aarch64=("${pkgname}-${pkgver}.zip::https://github.com/jbearak/raven/releases/download/v${pkgver}/raven-linux-arm64.zip")

package() {
    cd "$srcdir"

    install -Dm755 raven "$pkgdir/usr/bin/raven"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
}

sha256sums_x86_64=('f051b3e083de7fe60dc3c60a40fac9aa9ee0d231e9d7ec01d494a1b85b9e5cc3')
sha256sums_aarch64=('f051b3e083de7fe60dc3c60a40fac9aa9ee0d231e9d7ec01d494a1b85b9e5cc3')
