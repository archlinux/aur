# Contributor linuxer <linuxer@artixlinux.org>

pkgname=swap-runit
pkgalias=runit-swap
_realname=runit-swap
pkgdesc="Runit swap service"
alias=runit-swap
pkgver=2.0.0
pkgrel=1
pkgbase=swap-runit
replaces=('runit-swap')
arch=('any')
url="https://aur.archlinux.org/packages/swap-runit"
license=('GPL3')
groups=()
depends=('runit' 'util-linux>=2.26')
source=("https://github.com/thypon/runit-swap/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/${alias}-${pkgver}"
    install -Dm 755 runit-swap -t "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir"/etc/runit/sv/swap-runit
    install -Dm 644 swap/run "$pkgdir"/etc/runit/sv/swap-runit
    install -Dm 644 swap/finish "$pkgdir"/etc/runit/sv/swap-runit
}
