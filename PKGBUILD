# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=flipt-bin
pkgver=1.23.0
pkgrel=1
pkgdesc='An open source, self-hosted feature flag solution'
arch=('aarch64' 'x86_64')
url="https://flipt.io"
_githuburl="https://github.com/flipt-io/flipt"
license=('GPL3')
provides=()
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums_aarch64=('74bc0c0fcdac8fbbaf2b7134692d1fd3d5013fb2f04c5a8d9b33ad0f8c9696be')
sha256sums_x86_64=('b041f6499bcd0f5655a84e8c747961e9e1b34ad784432e85c5b7d0a49e86875b')

package() {
  install -Dm755 "${srcdir}"/flipt "${pkgdir}/usr/bin/flipt"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}"/config/default.yml "${pkgdir}/etc/conf.d/flipt.yml"
}