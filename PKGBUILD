# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>
pkgname=flipt-bin
pkgver=1.21.0
pkgrel=1
pkgdesc='An open source, self-hosted feature flag solution'
arch=('x86_64')
url="https://flipt.io"
_githuburl="https://github.com/flipt-io/flipt"
license=('GPL3')
provides=()
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_x86_64.tar.gz")
sha256sums=('5be774fe25fb817ea0dcde84c5040c4c479c1cefa4eea34a039bc4c67cb3e7fd')

package() {
  install -Dm755 "${srcdir}"/flipt "${pkgdir}/usr/bin/flipt"
  install -Dm644 "${srcdir}"/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}"/config/default.yml "${pkgdir}/etc/conf.d/flipt.yml"
}