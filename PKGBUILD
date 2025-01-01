# Maintainer: Ignacio Gonsalves <inscientebberman at tutanota dot com>
pkgname=gnu-slash-grub-git
pkgver=1.2.1
pkgrel=1
pkgdesc='Fix GRUB boot menu nonsense'
arch=('any')
url='https://github.com/themidnightmaniac/gnu-slash-grub'
license=('GPL-3.0-only')
depends=('bash')
makedepends=('git')
provides=("gnu-slash-grub=${pkgver}")
source=("${pkgname%-git}::git+https://github.com/themidnightmaniac/gnu-slash-grub.git#tag=v${pkgver}")
sha256sums=('SKIP')
package() {
    cd "${pkgname%-git}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 extra/${pkgname%-git}.hook "${pkgdir}/usr/share/libalpm/hooks/patch-grub.hook"
    install -Dm755 ${pkgname%-git} "${pkgdir}/usr/bin/${pkgname%-git}"
}
