# Maintainer: Aria Quinlan <hello@aria.coffee>
pkgname=mo-bin
pkgver=1.2.0
pkgrel=1
pkgdesc='A Markdown viewer that opens .md files in a browser with live-reload'
arch=('x86_64' 'aarch64')
url='https://github.com/k1LoW/mo'
license=('MIT')
provides=('mo')
conflicts=('mo')

source_x86_64=("${url}/releases/download/v${pkgver}/mo_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/mo_v${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('b386a7511dbd9d2eebce7fdaf9a3e8926b8b53b727863b50beff5151e05be4f7')
sha256sums_aarch64=('e1dff3a5c765a819056aa611c6985cd9f9f72d9a89cd40b30ef05da1930cb489')

package() {
    install -Dm755 mo "${pkgdir}/usr/bin/mo"

    # Install license if present in the tarball
    if [[ -f LICENSE ]]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    fi
}
