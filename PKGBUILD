# Maintainer: BryanLiang <liangrui.ch@gmail.com>

pkgname=aliyunpan-go-bin
pkgver=0.2.8
pkgrel=2
pkgdesc='阿里云盘命令行客户端，支持webdav文件服务，支持JavaScript插件，支持同步备份功能。(Precompiled version)'
arch=('x86_64')
url='https://github.com/tickstep/aliyunpan'
license=('Apache-2.0')
conflicts=('aliyunpan-go')
makedepends=('unzip')
source=("https://github.com/tickstep/aliyunpan/releases/download/v${pkgver}/aliyunpan-v${pkgver}-linux-amd64.zip")
sha512sums=('eccbb222382b26834e9d04229f2766dd0f12c5f791b0537597bdeb99b5c970374c1102a0699d868541836989b800fae4f5bf7af2e902df74e80af616fbce7349')
noextract=("aliyunpan-v${pkgver}-linux-amd64.zip")

prepare() {
    unzip aliyunpan-v${pkgver}-linux-amd64.zip
}

package() {
    cd "${srcdir}/aliyunpan-v${pkgver}-linux-amd64"
    install -Dm 755 aliyunpan "${pkgdir}/usr/bin/aliyunpan-go"
    install -Dm 644 manual.md "${pkgdir}/usr/share/docs/aliyunpan-go/manual.md"
}
