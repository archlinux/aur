# Maintainer: Ryan Ward <ryandward@gmail.com>
pkgname=fontconfig-fedora-better-fonts
pkgver=1.0
pkgrel=1
pkgdesc="Fontconfig rules to replace Microsoft fonts with open-source alternatives (from Fedora Better Fonts project)"
arch=('any')
url="https://github.com/silenc3r/fedora-better-fonts"
license=('custom')
depends=('fontconfig')
source=("https://raw.githubusercontent.com/silenc3r/fedora-better-fonts/master/fontconfig-font-replacements/36-repl-liberation-fonts.conf")
sha256sums=('SKIP')

package() {
  install -Dm644 36-repl-liberation-fonts.conf "$pkgdir/etc/fonts/conf.d/36-repl-liberation-fonts.conf"
}

post_install() {
  echo "Updating font cache..."
  fc-cache -fv
}

post_upgrade() {
  echo "Updating font cache..."
  fc-cache -fv
}

post_remove() {
  echo "Updating font cache..."
  fc-cache -fv
}

