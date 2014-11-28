# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=file-rename-utils
pkgver=1.7.3
pkgrel=2
pkgdesc="Set of file renaming utils written in bash"
arch=('any')
url="http://filerenameutils.sourceforge.net"
license=('GPL')
depends=('bash' 'coreutils' 'findutils' 'sed' 'mariadb')
source=(http://downloads.sourceforge.net/filerenameutils/$pkgname-$pkgver.tgz)
sha256sums=('4dd5b3d9ded64881b7e1dc8796dab0e00b52ef553baa1d95285c6eae4c60e913')

package() {
  cd "${srcdir}"/$pkgname

  install -d "${pkgdir}"/usr/bin
  cp -R \
    fromto htmlrename KTrash lowercase mv_capitalize mv_chars2null \
    mv_chars2underscore mv_lowercase mv_number mv_number.ext \
    mv_prefix mv_sed mv_spaces2underscore mv_suffix mv_underscore2hyphen \
    mv_uppercase replace swap Trash "${pkgdir}"/usr/bin

  install -d "${pkgdir}"/usr/man/man1
  cp -R man/* "${pkgdir}"/usr/man/man1

#file conflict with mysql package
  mv "${pkgdir}"/usr/bin/replace "${pkgdir}"/usr/bin/replace-fru
  mv "${pkgdir}"/usr/man/man1/replace.1.bz2 "${pkgdir}"/usr/man/man1/replace-fru.1.bz2  
}
