# Maintainer: uzvg <1497911983@qq.com>

pkgname=rime-uggx
pkgver=1.4.0
pkgrel=1

pkgdesc="一个用于 RIME 的郑码输入方案"
arch=(any)
url="https://github.com/X1aomu/rime-uggx"
license=('unknown')

depends=('rime-pinyin-simp' 'rime-emoji')
makedepends=('librime')
source=("$pkgname-$pkgver.tar.gz::https://github.com/X1aomu/$pkgname/archive/v$pkgver.tar.gz")

sha256sums=('64815629c0d3c94c9a94efa4e544312fc1b1791b4127768b5fa755f85b1eb18f')

# build() {
# 	cd "$pkgname-$pkgver"
# 	./configure --prefix=/usr
# 	make
# }

package() {
	cd "$pkgname-$pkgver"
    install -Dm644 *.yaml -t "$pkgdir/usr/share/rime-data/"
    rime_deployer --add-schema {uggx_fluency,uggx}
}