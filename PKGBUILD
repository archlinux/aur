# Maintainer: Stephen Erisman <aur at serisman dot com>

pkgname='xmrig-mo-bin'
pkgver='6.24.0mo1'
pkgrel='1'
pkgdesc='High performance RandomX, KawPow, CryptoNight, and AstroBWT CPU/GPU miner, with MoneroOcean auto alg switching. Pre-compiled.'
arch=('x86_64')
url="https://github.com/MoneroOcean/xmrig"
depends=('libuv' 'openssl-1.1' 'hwloc')
license=('GPL')
provides=('xmrig-mo')
conflicts=('xmrig-mo')
source=("${url}/releases/download/v6.24.0-mo1/xmrig-v6.24.0-mo1-lin64.tar.gz"
        "${pkgname/-bin/}.service"
        "${pkgname/-bin/}.sysusers")
sha256sums=('ef1426b8dfa14eb7d716b8afe8de32aa35741899d6d005a91fedfbd74d476506'
            'd900cb4231b6d548c746cb329560b6df8544e18335307cdcdf5045a86c54df7c'
            'd8f499302fb2b642fe02586c81c410a299e0a6e133aef1cc1c783bcdcb3f44f6')

package() {
  install -Dm775 "${srcdir}/xmrig" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 "${srcdir}/config.json" "${pkgdir}/etc/${pkgname/-bin/}/${pkgname/-bin/}.conf.example"
  install -Dm644 "${srcdir}/${pkgname/-bin/}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname/-bin/}.service"
  install -Dm0644 "${srcdir}/${pkgname/-bin/}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname/-bin/}.conf"
}
