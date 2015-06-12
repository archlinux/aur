# Maintainer: polyzen <polycitizen@gmail.com>

pkgname=firefox-extension-noscript-dev
pkgver=2.6.9.26rc3
pkgrel=1
pkgdesc='Allows JavaScript, Java (and other plugins) only for trusted domains of your choice.'
url=https://noscript.net
arch=('any')
license=('GPL')
depends=('firefox')
conflicts=('firefox-noscript')
source=("https://secure.informaction.com/download/betas/noscript-$pkgver.xpi")
sha256sums=('730df1c6f18e7b6981a4e03a78425e22836ec86d784ec01b6a912571c8f28bfc')

package() {
  local GLOBIGNORE=*.xpi:GPL.txt
  local dstdir="$pkgdir"/usr/lib/firefox/browser/extensions/"{73a6fe31-595d-460b-a920-fcc0f8843232}"

  install -d "$dstdir"
  cp -dpr --no-preserve=ownership * "$dstdir"
  chmod -R 755 "$dstdir"
}

# vim:set ts=2 sw=2 et:
