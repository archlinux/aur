# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Co-Maintainer: lapsus <yakov.till@gmail.com>
pkgname=ccusage
pkgver=20.0.13
pkgrel=1
pkgdesc="Analyze coding agent CLI token usage and costs from local data"
arch=('x86_64' 'aarch64')
url="https://github.com/ryoppippi/ccusage"
license=('MIT')
options=('!strip' '!debug')

_npm_base="https://registry.npmjs.org/@ccusage"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_npm_base}/ccusage-linux-x64/-/ccusage-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_npm_base}/ccusage-linux-arm64/-/ccusage-linux-arm64-${pkgver}.tgz")
sha256sums_x86_64=('1b7c9d6ec1d68d1cf797270dbbefbe488f7c077606d0dfc7055433ff76e8f5af')
sha256sums_aarch64=('5859038042cf98c40b183c184480591332e887298c9c4a36172732f89abbf140')

latestver() {
    curl -fsSL 'https://registry.npmjs.org/ccusage/latest' | jq -r '.version'
}

package() {
    install -Dm755 package/bin/ccusage "${pkgdir}/usr/bin/ccusage"
    install -Dm644 package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
