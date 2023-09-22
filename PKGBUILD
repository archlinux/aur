# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=flipt-bin
pkgver=1.27.2
pkgrel=1
pkgdesc='An open source, self-hosted feature flag solution'
arch=('aarch64' 'x86_64')
url="https://flipt.io"
_githuburl="https://github.com/flipt-io/flipt"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('4cb00e9ef62da3fc3a4b515fc001f1bbedd6a05c5bd00edfa17be2e561e63cd6')
sha256sums_x86_64=('18a0cde0d9d6822b0dcfef467e3bab79e4fa3aace4b5feef1d159e8c1f27c1b5')
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${srcdir}/config/default.yml" "${pkgdir}/etc/conf.d/${pkgname%-bin}.yml"
}