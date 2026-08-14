# Maintainer: brs.btls <lumina@archlinux.local>
pkgname=dscb
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple and fast custom Discord scripting language and runtime"
arch=('any')
url="https://dscb.bearstool.com"
license=('MIT')
depends=('python' 'python-discord')
conflicts=('dscbot')
provides=('dscbot')
replaces=('dscbot')
source=('dscb' 'dscb.service')
sha256sums=('8f5feec675b76589e8b863a6e54c508bc33d71b55318a5a053d60e1c4aa2e7d6'
            '6e27a0f7124dfe7c9d616a7b9c9aee23218661d857a08ee5ae64b8b6728dd197')

package() {
    install -Dm755 "${srcdir}/dscb" "${pkgdir}/usr/bin/dscb"
    ln -sf "/usr/bin/dscb" "${pkgdir}/usr/bin/dscbot"
    install -Dm644 "${srcdir}/dscb.service" "${pkgdir}/usr/lib/systemd/system/dscb.service"
}
