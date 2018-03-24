# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com>

pkgname=xlesspass-bin
pkgver=1.10
pkgrel=1
arch=('x86_64')
pkgdesc="Allows you to use a single master key to obtain the key of your saved sessions."  
arch=('x86_64')
url='https://github.com/daltomi/XLessPass'
license=('GPL3')
depends=('gtk2')
conflicts=('xlesspass-git')
source=("$url/raw/master/bin/xlesspass-v$pkgver-x64.gtk2.tar.xz")
md5sums=('2156aa29e3a29720412b47590f5547b7')

package() {
  cd $srcdir
  tar xJvf *.tar.xz
  install -Dm755 xlesspass "$pkgdir/usr/bin/xlesspass"
  install -Dm644 xlesspass.desktop "$pkgdir/usr/share/applications/xlesspass.desktop"
  install -Dm644 key.png "$pkgdir/usr/share/pixmaps/xlesspass.png"
  mkdir -p "$pkgdir/usr/share/xlesspass/i18n"
  install -Dm644 i18n/* "$pkgdir/usr/share/xlesspass/i18n/"
}
