# Maintainer: tosuke <tasukeprg at gmail dot com>
pkgname=ttf-nasu
pkgver=20141215
pkgrel=1
pkgdesc="Japanese TrueType font. Made by SourceHanSans, SourceCodePro and M+OUTLINEFONTS"
arch=('any')
url="http://iij.dl.osdn.jp/users/7/7586/NasuFont-README.txt"
license=('Apache')
depends=('fontconfig' 'xorg-font-utils')
install=$pkgname.install
source=("https://ja.osdn.net/downloads/users/7/7587/NasuFont-20141215.zip")
sha512sums=("899a0c488d1bd603be96606fb4b56b7fae9773c4d765c5cbc29e25953226ccbc9d5457301be7b7b7a99c8170ed4d685b5c0cae0ddeb90a95e97d884725a182cc")

package() {
  # install fonts
  cd "$srcdir/NasuFont$pkgver/"

  for ttf in $(ls *.ttf); do
    install -Dm644 $ttf "$pkgdir/usr/share/fonts/TTF/$ttf"
  done

  # install License
  cd "$srcdir/NasuFont$pkgver/"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}


