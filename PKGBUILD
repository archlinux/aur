# Maintainer: Christian Finnberg <christian at finnberg dot net>

pkgname=sekiro-grub-theme-git
_themename=sekiro
pkgver=r1.39c5f4d
pkgrel=1
pkgdesc="A GRUB2 theme with japanese style"
url='https://github.com/semimqmo/sekiro_grub_theme'
arch=('any')
license=('MIT')
depends=('grub')
makedepends=('git')
install="${pkgname}.install"
source=("${pkgname}"::"git+https://github.com/semimqmo/sekiro_grub_theme.git")
md5sums=('SKIP')

package() {
  cd "${srcdir}"
  install -dm 755 $pkgdir/usr/share/grub/themes/${_themename}
  cp -rf --no-preserve=ownership ${pkgname}/Sekiro/* $pkgdir/usr/share/grub/themes/${_themename}/
  cd "$pkgname"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
