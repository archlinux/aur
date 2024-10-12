# Maintainer: cmach_socket <cmach_socket@outlook.com>
pkgname=kazumi-bin
pkgver=1.3.6
pkgrel=1

pkgdesc='基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕。'
arch=('x86_64')
url='https://github.com/Predidit/Kazumi'
license=('GPL3')

source_x86_64=("$pkgname-$pkgver.deb::https://github.com/Predidit/Kazumi/releases/download/$pkgver/Kazumi_linux_${pkgver}_amd64.deb")
sha256sums_x86_64=('af5ef12f0621cde0c73f885e962c1457589d5af53fbe6da0f36d3f3e44a9a08b')
depends=('libayatana-appindicator' 'xdg-user-dirs' 'webkit2gtk-4.1')
options=(!debug)

package() {
    bsdtar -xf "$srcdir/data.tar.zst" -C "$pkgdir/"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/Kazumi/kazumi  "${pkgdir}/usr/bin/"
}
