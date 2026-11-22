# Maintainer: Tangram <support@tangram.dev>
pkgname=tangramdotdev-bin
pkgver=0.0.0
pkgrel=1
pkgdesc='Tangram build system and package manager'
arch=('x86_64')
url='https://tangram.dev'
license=('MIT')
depends=('ca-certificates' 'fuse3' 'glibc' 'iptables' 'libcap-ng' 'libgcc'
         'nftables' 'passt' 'squashfs-tools' 'systemd')
backup=('etc/tangram/config.json')
options=('!debug' '!strip')
source=('config.json' 'tangram.service' 'tangram.sysusers' 'LICENSE')
sha256sums=('04af15d0067b0aba11513371f685b00e66f8f9b9201196a4ace115acf55d36f1' '0337f6cccc17812a95dd3a54da8618693e709d0ef248d0b2714fabd72670429c' '09c80f56740044a122241c1acc907499ae55cf986631b918402464bd97756127' 'f4452cabf90c5e52c79ca902afb331f7b42d4cf55365166650bf719ed93fcae1')
source_x86_64=('https://github.com/tangramdotdev/tangram/releases/download/v0.0.0/tangram_x86_64-linux-gnu.tar.gz')
sha256sums_x86_64=('c246c4a562c91a16f2a97ec1a4a30660d1dd8e51fdd39c673ac8a48581ee4b2a')

package() {
    install -Dm755 tangram "$pkgdir/usr/lib/tangram/tangram"
    install -Dm755 tgx "$pkgdir/usr/bin/tgx"
    ln -s ../lib/tangram/tangram "$pkgdir/usr/bin/tg"
    install -Dm644 config.json "$pkgdir/etc/tangram/config.json"
    install -Dm644 tangram.service "$pkgdir/usr/lib/systemd/system/tangram.service"
    install -Dm644 tangram.sysusers "$pkgdir/usr/lib/sysusers.d/tangram.conf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
