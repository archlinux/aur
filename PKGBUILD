# Maintainer: yaminogame <yaminogame at live dot com>
pkgname=baidunetdisk
pkgver=2.0.1
pkgrel=2
pkgdesc="Baidunetdisk Client, converted from .rpm package"
arch=("x86_64")
url="http://pan.baidu.com/"
license=('custom')
depends=()

DLAGENTS=("https::/usr/bin/curl -A 'Mozilla' -fLC - --retry 3 --retry-delay 3 -o %o %u")

source=(
	"https://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/${pkgname}_linux_${pkgver}.rpm"
	"https://pan.baidu.com/disk/duty/index.html"
)

md5sums=('134bea2832e8e74c1646eb09f375b008'
	 'SKIP')

options=('!strip')

package() {
  cd ${srcdir}
  cp -r opt usr ${pkgdir}
  install -D -m644 index.html ${pkgdir}/usr/share/licenses/$pkgname/license.html
}
