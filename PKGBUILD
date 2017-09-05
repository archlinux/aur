# Maintainer: now-im <now.im.627@gmail.com>

pkgname=('la-capitaine-icon-theme')
pkgver=0.5.0
pkgrel=2
pkgdesc="An icon pack designed to integrate with most desktop environments"
arch=('any')
url="https://github.com/keeferrourke/$pkgname"
license=('GPL3')
optdepends=('elementary-icon-theme' 'breeze-icons' 'gnome-icon-theme')
conflicts=('la-capitaine-icon-theme-git')
source=("https://github.com/keeferrourke/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5a4a1250ff770b2111db199b5b1cf1ec455572dde84fa34e953b46b50e17775b')

prepare() {
  cd $pkgname-pkgver

}

package() {
  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' $pkgname-pkgver "${pkgdir}"/usr/share/icons/$pkgname-pkgver

  find "${pkgdir}" -type d -exec chmod 755 {} +
  find "${pkgdir}" -type f -exec chmod 644 {} +
}

# vim: ts=2 sw=2 et:
