# Maintainer: mwberry <null [at] example [dot] org>
pkgname=mkinitcpio-nannycam
pkgver=0.1
pkgrel=1
pkgdesc="Assists protecting encrypted boot partitions from (some) Evil Maid attacks"
url="https://wiki.archlinux.org/index.php/User:Mwberry/mkinitcpio-nannycam"
arch=('any')
license=('GPL2')
depends=('parted' 'openssl' 'qrencode' 'bash' 'coreutils')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=('config' 'hook' 'install' 'nannycam' 'nannycam.functions')
md5sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

# No build step because all sources are shell scripts

package() {

  install -D "${srcdir}/hook" "${pkgdir}/usr/lib/initcpio/hooks/nannycam"
  install -D "${srcdir}/install" "${pkgdir}/usr/lib/initcpio/install/nannycam"

  install -D "${srcdir}/config" "${pkgdir}/etc/nannycam.conf"

  install -D "${srcdir}/nannycam" "${pkgdir}/usr/lib/nannycam/nannycam"
  install -D "${srcdir}/nannycam.functions" "${pkgdir}/usr/lib/nannycam/nannycam.functions"

}

# vim:set ts=2 sw=2 et:
