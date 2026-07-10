# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>
# Co-Maintainer: lapsus <yakov.till@gmail.com>
pkgname=ccusage
pkgver=20.0.17
pkgrel=1
pkgdesc="Analyze coding agent CLI token usage and costs from local data"
arch=('x86_64' 'aarch64')
url="https://github.com/ryoppippi/ccusage"
license=('MIT')
options=('!strip' '!debug')

_npm_base="https://registry.npmjs.org/@ccusage"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tgz::${_npm_base}/ccusage-linux-x64/-/ccusage-linux-x64-${pkgver}.tgz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tgz::${_npm_base}/ccusage-linux-arm64/-/ccusage-linux-arm64-${pkgver}.tgz")
sha256sums_x86_64=('639d2161b2dc2752b976ce31587193485547565fa2f261adb004b9f528b0a064')
sha256sums_aarch64=('e79e2de1387b128480e5f7facc478876208432cba8082e7f64a90e74f996f53f')

latestver() {
    curl -fsSL 'https://registry.npmjs.org/ccusage/latest' | jq -r '.version'
}

package() {
    install -Dm755 package/bin/ccusage "${pkgdir}/usr/bin/ccusage"
    install -Dm644 package/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
