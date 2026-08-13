# Maintainer: brs.btls <lumina@archlinux.local>
pkgname=dscb
pkgver=1.0.0
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
sha256sums=('b34c28142e8e3f3cf83779b88309bb92d53aedf30455b1345393d1d1ca628c29'
            '3e68dcebf2cdcd84f53a3028a8c552c2a8b375524da97f9757bb67ebe0bd0fbc')

package() {
    install -Dm755 "${srcdir}/dscb" "${pkgdir}/usr/bin/dscb"
    ln -sf "/usr/bin/dscb" "${pkgdir}/usr/bin/dscbot"
    install -Dm644 "${srcdir}/dscb.service" "${pkgdir}/usr/lib/systemd/system/dscb.service"
}
