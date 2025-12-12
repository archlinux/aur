# Maintainer: vcup <me@vcup.moe>
pkgname=ani-rss
pkgver=2.4.15
pkgrel=1
pkgdesc="自动追番、订阅、下载 蜜柑RSS动漫"
arch=('any')
url="https://github.com/wushuo894/ani-rss"
license=('GPL-2.0')
depends=('java-runtime>=17')
backup=('etc/ani-rss/config.v2.json')
install=${pkgname}.install
source=(
  "${pkgname}-${pkgver}.jar::https://github.com/wushuo894/ani-rss/releases/download/v${pkgver}/ani-rss-jar-with-dependencies.jar"
  'ani-rss.service'
  'LICENSE'
)
sha512sums=('2aec054b93db847a407189a5979f659bedb1d12524a62778e9bc927e2bfeede830bc6f00c8fe8f303e91e0df62add9d4d80c6a0e0a8b7959a4e03e0e71efb81b'
            '68b316811e619a1970993c98326f4a0c7296c323ec4d881077d060da1ce81bd255d06db1eccbfae6f936dc9e9bc7b0c6b7dd9256c6d9fa96911e7bdcf694cdeb'
            'aee80b1f9f7f4a8a00dcf6e6ce6c41988dcaedc4de19d9d04460cbfb05d99829ffe8f9d038468eabbfba4d65b38e8dbef5ecf5eb8a1b891d9839cda6c48ee957')

package() {
  mkdir -p "${pkgdir}/etc/${pkgname}" "${pkgdir}/var/log/${pkgname}"
  install -Dm644 "${pkgname}-${pkgver}.jar" "${pkgdir}/usr/lib/${pkgname}/${pkgname}.jar"
  install -Dm644 'ani-rss.service' "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

