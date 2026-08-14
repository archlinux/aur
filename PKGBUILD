# Maintainer: brs.btls <lumina@archlinux.local>
pkgname=dscb
pkgver=1.2.0
pkgrel=1
pkgdesc="A simple and fast custom Discord scripting language and runtime"
arch=('any')
url="https://aur.archlinux.org/packages/dscb"
license=('MIT')
depends=('python' 'python-discord')
conflicts=('dscbot')
provides=('dscbot')
replaces=('dscbot')
source=('dscb' 'dscb.service')
sha256sums=('d76e527a2725f9aa533e43f0ad18bd991a8544c57f1fde90dff76f2c76957da7'
            '6e27a0f7124dfe7c9d616a7b9c9aee23218661d857a08ee5ae64b8b6728dd197')

package() {
    install -Dm755 "${srcdir}/dscb" "${pkgdir}/usr/bin/dscb"
    ln -sf "/usr/bin/dscb" "${pkgdir}/usr/bin/dscbot"
    install -Dm644 "${srcdir}/dscb.service" "${pkgdir}/usr/lib/systemd/system/dscb.service"
}
