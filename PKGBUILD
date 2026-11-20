# Maintainter: Ben Song <bensongsyz@gmail.com>
pkgname=anytls-go-bin
pkgver=0.0.13
pkgrel=1
pkgdesc="A reference implementation of proxy protocol to mitigate the issue of TLS in TLS."
arch=('x86_64' 'aarch64')
url="https://github.com/anytls/anytls-go"
options=(!strip !debug)
source_x86_64=( "$url"/releases/download/v${pkgver}/anytls_${pkgver}_linux_amd64.zip)
source_aarch64=("$url"/releases/download/v${pkgver}/anytls_${pkgver}_linux_arm64.zip)

sha256sums_x86_64=( 7e80fc099ea54a71110d256dd60648c47c63c70a3c499eb1f6d7aaa4edb7016f)
sha256sums_aarch64=(88cb762c3c8eb56b46a2d8d6feab9c0858655192143fc164874229499246a956)

package() {
    install -D -m755 -t ${pkgdir}/usr/bin               ${srcdir}/anytls-{client,server}
    install -D -m644 -t ${pkgdir}/usr/share/doc/anytls  ${srcdir}/readme.md
    ls ${pkgdir}/usr
}
