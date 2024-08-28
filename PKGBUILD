# Maintainer: Hans Müller <schreibemirhalt@gmail.com>

pkgname=nani
pkgver=0.2.0
pkgrel=1
pkgdesc="Now you can speak Japanese. Like sl but for mistypers of nano. Jojo references. Includes optional Katakana and Hiragana quiz mode for starting with Japanese learning.."
arch=('any')
url="https://github.com/schrmh/nani"
license=('unknown')
depends=('nano')
source=('nani' 'nani.conf' 'hiragana.nani' 'katakana.nani')
md5sums=('997c1ddc78558fef83aa9c92e61d5118' '9fd9972f6fcc1805ac751d6be296320d' '7d139d867f963a47c16135fbc9b6bb03' '5418e936a323fd6558d9b25702b80203')

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/nani"
  
  install -d  "$HOME/.config/nani"
  install "$srcdir/nani.conf" "$HOME/.config/nani/nani.conf"

  install -d "$HOME/.config/nani/learning"
  install "$srcdir/hiragana.nani" "$HOME/.config/nani/learning/hiragana.nani"
  install "$srcdir/katakana.nani" "$HOME/.config/nani/learning/katakana.nani"

  printf "\033[0;35m Thanks for installing this package. Further (optional) manual setup steps: \n"
  printf "\033[0;35m Edit files in $HOME/.config/nani/ to change settings (e.g. activate learning mode) \n"
}
