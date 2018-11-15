# Maintainer: now-im <now.im.627@gmail.com>

pkgname=('la-capitaine-icon-theme')
pkgver=0.6.1
pkgrel=1
pkgdesc="La Capitaine is an icon pack — designed to integrate with most desktop environments."
arch=('any')
url="https://github.com/keeferrourke/$pkgname"
license=('GPL3')
optdepends=('elementary-icon-theme' 'breeze-icons' 'gnome-icon-theme')
conflicts=('la-capitaine-icon-theme-git')
source=("https://github.com/keeferrourke/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('9adb3123bf61464696400af43000b61de1825d2ce4b4ad4f21dd78091bd55e73')

prepare() {
  cd $pkgname-$pkgver

}

package() {
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' $pkgname-$pkgver "${pkgdir}"/usr/share/icons/$pkgname-$pkgver

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
  find ${pkgdir}/usr -type f -name '.directory' -delete
  rm -rf "$pkgdir/usr/share/icons/$pkgname-$pkgver/.gitignore"
  rm -rf "$pkgdir/usr/share/icons/$pkgname-$pkgver/.git"
  rm -rf "$pkgdir/usr/share/icons/$pkgname-$pkgver/.github"
  rm -rf "$pkgdir/usr/share/icons/$pkgname-$pkgver/.product"
}

# vim: ts=2 sw=2 et:
