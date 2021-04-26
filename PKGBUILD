# Maintainer: now-im <now.im.627@gmail.com>

pkgname=('la-capitaine-icon-theme')
pkgver=0.6.2
pkgrel=1
pkgdesc="La Capitaine is an icon pack — designed to integrate with most desktop environments."
arch=('any')
url="https://github.com/keeferrourke/$pkgname"
license=('GPL3')
optdepends=('elementary-icon-theme' 'breeze-icons' 'gnome-icon-theme')
conflicts=('la-capitaine-icon-theme-git')
source=("https://github.com/keeferrourke/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e63e4bc97a7bbf4db71f17fa3b1c71086e3ed8b1dc44b4d10f95d97aa7db2c9d')

prepare() {
  cd $pkgname-$pkgver

}

package() {
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' $pkgname-$pkgver "${pkgdir}"/usr/share/icons/la-capitaine

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  find ${pkgdir}/usr -type f -name '.directory' -delete
  rm -rf "$pkgdir/usr/share/icons/la-capitaine/.gitignore"
  rm -rf "$pkgdir/usr/share/icons/la-capitaine/.git"
  rm -rf "$pkgdir/usr/share/icons/la-capitaine/.github"
  rm -rf "$pkgdir/usr/share/icons/la-capitaine/.product"
}

# vim: ts=2 sw=2 et:
