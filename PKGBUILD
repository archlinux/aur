#Maintainer: bilibili_xiaok <the_xiaok@qq.com>
#Contributor: zh99998 <zh99998@gmail.com>
#Contributor: bilibili_xiaok <the_xiaok@qq.com>
#Contributor: <reg-archlinux AT klein DOT tuxli DOT ch>

pkgname=tcpping
pkgver=2.4
pkgrel=2
pkgdesc='test response times using TCP SYN packets'
arch=('any')
url='https://github.com/deajan/tcpping'
depends=('traceroute')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/deajan/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dc3072d3d0ba2e5b072ce800f6b067c930fef86798504b11b328925e749b34ff')

package() {
  cd ${pkgname}-${pkgver}
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
   install -Dvm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
   setcap cap_net_raw+ep /usr/bin/tcpping
}
