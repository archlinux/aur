# Maintainer: mwberry <null [at] example [dot] org>
pkgname=mkinitcpio-yk2fe
pkgver=0.1
pkgrel=1
pkgdesc="Two factor LUKS disk encryption using Yubikey Challenge Response"
url="https://wiki.archlinux.org/index.php/User:Mwberry/mkinitcpio-ykchalresp"
arch=('any')
license=('GPL2')
depends=('cryptsetup-keyscript' 'yubikey-personalization' 'bash' 'coreutils')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=''
source=('hook' 'install' 'yk2fe' 'add_yk2fe')
md5sums=(
  '70415485bc618f06c04b17ee6dff6e5f'
  'dca02e52b6241822e490b5465992bec6'
  '63cb9137d5e76a51177fffc4f2806458'
  '43f2ac34098f5dc44f266fc8b844b692'
)

# No build step because all sources are shell scripts

package() {

  install -D "${srcdir}/yk2fe" "${pkgdir}/usr/lib/yk2fe/yk2fe"
  install -D "${srcdir}/add_yk2fe" "${pkgdir}/usr/bin/add_yk2fe"
  install -D "${srcdir}/hook" "${pkgdir}/usr/lib/initcpio/hooks/yk2fe"
  install -D "${srcdir}/install" "${pkgdir}/usr/lib/initcpio/install/yk2fe"
}

# vim:set ts=2 sw=2 et:
