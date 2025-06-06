#Maintainer: bilibili_xiaok <the_xiaok@qq.com>
#Contributor: zh99998 <zh99998@gmail.com>
#Contributor: bilibili_xiaok <the_xiaok@qq.com>
#Contributor: <reg-archlinux AT klein DOT tuxli DOT ch>

pkgname=tcpping
pkgver=2.7
pkgrel=1
pkgdesc='test response times using TCP SYN packets'
arch=('any')
url='https://github.com/deajan/tcpping'
license=('GPL-3.0')
depends=('traceroute')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deajan/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f527b00174c08b47f029fb386c9e6263ac52d4bff1e186deddc83e9af4556cef')

package() {
  cd ${pkgname}-${pkgver}
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dvm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
  setcap cap_net_raw+ep "${pkgdir}/usr/bin/tcpping"
}
