# Maintainer: snuglinux

pkgname=mkinitcpio-autohooks
pkgver=0.0.1
pkgrel=1
pkgdesc="Auto-manage mkinitcpio HOOKS based on mdraid/LUKS presence and rebuild initramfs"
arch=('any')
license=('GPL2')
depends=('bash' 'coreutils' 'gawk' 'grep' 'mkinitcpio' 'util-linux')
source=("https://github.com/snuglinux/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f4e1304c08a202208a0a0911cd9a0f76f9b19e126861852ff9a4b0b1b741bc87')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 mkinitcpio-autohooks         "${pkgdir}/usr/bin/mkinitcpio-autohooks"
  install -Dm644 90-mkinitcpio-autohooks.hook "${pkgdir}/usr/share/libalpm/hooks/90-mkinitcpio-autohooks.hook"
  install -Dm644 README.md                     "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 LICENSE                      "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
