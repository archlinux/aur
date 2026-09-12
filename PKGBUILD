# Maintainer: novica <nnovica@gmail.com>

pkgname=raven-bin
pkgver=0.20.2 # renovate: datasource=github-tags depName=jbearak/raven
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

sha256sums_x86_64=('049c8edf37468f23df9fc7115b958dc4ceada8b9b2c59eb889840446ad22cdd7')
sha256sums_aarch64=('871599324f52e90dffb675fd7cedc989e68c691e19965785802077fadc0e284c')
