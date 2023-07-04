# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=flipt-bin
pkgver=1.23.2
pkgrel=1
pkgdesc='An open source, self-hosted feature flag solution'
arch=('aarch64' 'x86_64')
url="https://flipt.io"
_githuburl="https://github.com/flipt-io/flipt"
license=('GPL3')
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('688ec4d4b027f1b8431672c3f3116e5979335795f76622cf07816919202c962b')
sha256sums_x86_64=('d4cae8d4eff7cd84eec0efdcea0a0ad0ba453c8ac34d220e1b9f276fac1ee2ef')

package() {
  install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
  install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/config/default.yml" "${pkgdir}/etc/conf.d/${pkgname%-bin}.yml"
}