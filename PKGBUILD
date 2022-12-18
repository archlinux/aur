# Maintainer: Ulrich Ölmann <ulrich.oelmann@web.de>
pkgname='mkinitcpio-kpartx'
pkgver=0.1
pkgrel=1
pkgdesc='mkinitcpio hook allowing for a GPT partitioned LUKS device not needing LVM'
url='https://github.com/OnkelUlla/mkinitcpio-kpartx'
arch=('any')
depends=('mkinitcpio' 'multipath-tools')
source=('kpartx_hook' 'kpartx_install')
sha256sums=('55cbf0e17f16930b39a66218f245cbd94446b675fb4f316588281b48ff4e4908'
            '534b699571e345a508b31570c95ebae164351ad0052aca001f067b0cbde6b9f4')

package() {
    install --owner=root --group=root --mode=0644 -D ${srcdir}/kpartx_hook    ${pkgdir}/usr/lib/initcpio/hooks/kpartx
    install --owner=root --group=root --mode=0644 -D ${srcdir}/kpartx_install ${pkgdir}/usr/lib/initcpio/install/kpartx
}
