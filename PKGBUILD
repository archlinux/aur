# Maintainer: snuglinux

pkgname=mkinitcpio-autohooks
pkgver=0.0.3
pkgrel=1
pkgdesc="Auto-manage mkinitcpio HOOKS based on mdraid/LUKS presence and rebuild initramfs"
arch=('any')
license=('GPL2')
depends=('bash' 'coreutils' 'gawk' 'grep' 'mkinitcpio' 'util-linux')
source=("https://github.com/snuglinux/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('af65ba4c00d59adac0d833b7902086e8decd614762f380dbf06b13de0662d04b')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 mkinitcpio-autohooks         "${pkgdir}/usr/bin/mkinitcpio-autohooks"
  install -Dm644 90-mkinitcpio-autohooks.hook "${pkgdir}/usr/share/libalpm/hooks/90-mkinitcpio-autohooks.hook"
  install -Dm644 hooks-udev.conf              "${pkgdir}/etc/mkinitcpio.conf.d/hooks-udev.conf"
  install -Dm644 README.md                    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 LICENSE                      "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
