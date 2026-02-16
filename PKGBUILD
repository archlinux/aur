# Maintainer: snuglinux

pkgname=mkinitcpio-autohooks
pkgver=0.0.2
pkgrel=1
pkgdesc="Auto-manage mkinitcpio HOOKS based on mdraid/LUKS presence and rebuild initramfs"
arch=('any')
license=('GPL2')
depends=('bash' 'coreutils' 'gawk' 'grep' 'mkinitcpio' 'util-linux')
source=("https://github.com/snuglinux/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7c82569b7895b886fd28b9f62f4a79539fb95828c9cfbab10d172b26ee25824f')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -Dm755 mkinitcpio-autohooks         "${pkgdir}/usr/bin/mkinitcpio-autohooks"
  install -Dm644 90-mkinitcpio-autohooks.hook "${pkgdir}/usr/share/libalpm/hooks/90-mkinitcpio-autohooks.hook"
  install -Dm644 hooks-udev.conf              "${pkgdir}/etc/mkinitcpio.conf.d/hooks-udev.conf"
  install -Dm644 README.md                    "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 LICENSE                      "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
