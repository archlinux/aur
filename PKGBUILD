# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=postie-bin
pkgver=0.0.31
pkgrel=1
pkgdesc="NZB uploader"
arch=('x86_64')
url="https://github.com/javi11/postie"
license=('MIT')
options=(!strip !debug)
source=("https://github.com/javi11/postie/releases/download/v${pkgver}/postie-cli_v${pkgver}_linux_amd64.tar.gz"
        "https://github.com/javi11/postie/releases/download/v${pkgver}/postie-web-linux-amd64.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/javi11/postie/refs/heads/main/LICENSE"
        "postie.service"
        "postie.sysusers"
        "postie.tmpfiles")

sha256sums=('738fbee15284ed686a405bd4ecd32050a31e24cd4e723cf9b13d4e5e0428db69'
            'a0243e19996172285535b304a81989bcfd86ebc95247a33795ce4061a959c70a'
            '18e2f19467d70b1305011e1afc0a569c959a75a0b610f9457f552fa410d6a3c7'
            'd68ed9700bdab94c68ad28c6de4ffa478ac250817d59d9cca38a4511d8cf841d'
            '6e2c939ae4a5759117a42913e98783bd9189cf160ed299b02cb045fc3f838974'
            'bbcf7e3fdd98c0d9f67bd40a21bb40e3c8c7404c9fdd594d74fcf9736025b354')

package() {
    install -Dm755 $srcdir/postie-cli-linux-amd64 $pkgdir/usr/bin/postie
    install -Dm755 $srcdir/postie-web-linux-amd64 $pkgdir/usr/bin/postie-web

    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

    install -Dm644 $srcdir/postie.service $pkgdir/usr/lib/systemd/system/postie.service
    install -Dm644 $srcdir/postie.sysusers $pkgdir/usr/lib/sysusers.d/postie.conf
    install -Dm644 $srcdir/postie.tmpfiles $pkgdir/usr/lib/tmpfiles.d/postie.conf
}

