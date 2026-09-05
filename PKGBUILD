# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=postie-bin
pkgver=0.0.32
pkgrel=1
pkgdesc="NZB uploader"
arch=('x86_64')
url="https://github.com/kipsilabs/postie"
license=('MIT')
options=(!strip !debug)
source=(
    "https://github.com/kipsilabs/postie/releases/download/v${pkgver}/postie-cli_v${pkgver}_linux_amd64.tar.gz"
    "https://github.com/kipsilabs/postie/releases/download/v${pkgver}/postie-web-linux-amd64.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/kipsilabs/postie/refs/heads/main/LICENSE"
    "postie.service"
    "postie.sysusers"
    "postie.tmpfiles"
)
sha256sums=(
    '181a9253f73b8e4c0c3181752ca2f4368758335822b889a70268c12f7a7315ed'
    '8904130847107bf52c235ffeba79ba864c4dde053073a787ad80d9dbfda49b78'
    '18e2f19467d70b1305011e1afc0a569c959a75a0b610f9457f552fa410d6a3c7'
    'cb96bc5e276b5816e5d4e930141f028637bf0b5a701b6f482d0ff58ac83e3f17'
    '6e2c939ae4a5759117a42913e98783bd9189cf160ed299b02cb045fc3f838974'
    'bbcf7e3fdd98c0d9f67bd40a21bb40e3c8c7404c9fdd594d74fcf9736025b354'
)

package() {
    depends=('glibc' 'libgcc' 'libstdc++')
    install -Dm755 "$srcdir/postie-cli-linux-amd64" "$pkgdir/usr/bin/postie"
    install -Dm755 "$srcdir/postie-web-linux-amd64" "$pkgdir/usr/bin/postie-web"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/postie.service" "$pkgdir/usr/lib/systemd/system/postie.service"
    install -Dm644 "$srcdir/postie.sysusers" "$pkgdir/usr/lib/sysusers.d/postie.conf"
    install -Dm644 "$srcdir/postie.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/postie.conf"
}

