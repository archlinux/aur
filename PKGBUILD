# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=redisshake-bin
pkgver=4.9.0
pkgrel=1
pkgdesc="RedisShake is a Valkey/Redis data processing and migration tool"
arch=('x86_64' 'aarch64')
url="https://github.com/tair-opensource/RedisShake"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/tair-opensource/RedisShake/v${pkgver}/license.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/redis-shake-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/redis-shake-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('d5572c959a0e9f3254d33270a4c90521b52a35fa158849d1db4c5c6708528cbd')
sha256sums_x86_64=('3a8b61fd5259a1deb5ffe4cdcfdb9f80f5c34a7254483066be0eea4152540b4e')
sha256sums_aarch64=('c8479d2896b4495397e7be4d53a6027ad1ba2f229f497d80fad4b840db6ce755')

package() {
  install -Dm755 "./redis-shake" "${pkgdir}/usr/bin/redis-shake"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
