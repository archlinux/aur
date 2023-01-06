# Maintainer: seiuneko <chfsefefgesfen foxmail>

_pkgname=coolq-cqhttp-api
pkgname=${_pkgname}-bin
pkgver=4.15.0
pkgrel=1
pkgdesc="CoolQ 插件实现通过 HTTP 上报事件信息及调用接口"
arch=(any)
url="https://github.com/richardchien/coolq-http-api"
license=('GPL3')
groups=(eqs)
backup=(etc/coolq/app/io.github.richardchien.coolqhttpapi/config.json)
depends=(coolq)
provides=(coolq-cqhttp-api)
install=coolq-cqhttp-api.install
source=("https://github.com/richardchien/coolq-http-api/releases/download/v$pkgver/io.github.richardchien.coolqhttpapi.cpk"
        config.json
        tmpfiles.d)
sha512sums=('5624bc26dc6f8fb6c03f0d4d4c5b4b83ce1de112682747eb8b9b2d11c6f4205c7b22e53d0d40ef06f4a2731a6d4a099fbdd9348d061827cd9549434dc6db1f11'
            'e35f4c0b1061e38f88459035fb23ba6658a26d8f9d5b56ce96bb9d0a5afab18a376274f837b72c3efcf700ae8157d6363ae89f074cec8a454d24ddb11b12aed8'
            '991cb2da80f16f47a49b439c8f42acef9d112d9a88e29cb6ea972e2c3957ab49cbb95a9a6aa3403be8a2cf38ffa09f08be4648a45cff4d46a50fb165a2fa4a05')

package() {
  install -Dm644 io.github.richardchien.coolqhttpapi.cpk "$pkgdir/usr/lib/coolq/app/io.github.richardchien.coolqhttpapi.cpk"
  install -Dm644 config.json "$pkgdir/etc/coolq/app/io.github.richardchien.coolqhttpapi/config.json"

  install -Dm644 tmpfiles.d "$pkgdir/usr/lib/tmpfiles.d/coolq-cqhttp-api.conf"
}
