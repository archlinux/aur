# Maintainer: Lumina <admin@archlinux.local>
pkgname=dscb
pkgver=1.0.0
pkgrel=1
pkgdesc="Enterprise-grade Discord Scripting Language (DSC) compiler and runtime"
arch=('any')
url="https://aur.archlinux.org/packages/dscb"
license=('MIT')
depends=('python' 'python-discord')
conflicts=('dscbot')
provides=('dscbot')
replaces=('dscbot')
source=('dscb' 'dscb.service')
sha256sums=('4dcc75045e807714a348ff405b7b642680c22c4438727b4203e05505ac851b5c'
            '4a37177a7618f802828769f3ff70ae4e78b58e3e32a3795e0605d1d3492a4ace')

package() {
    install -Dm755 "${srcdir}/dscb" "${pkgdir}/usr/bin/dscb"
    ln -sf "/usr/bin/dscb" "${pkgdir}/usr/bin/dscbot"
    install -Dm644 "${srcdir}/dscb.service" "${pkgdir}/usr/lib/systemd/system/dscb.service"
}
