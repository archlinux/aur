# Maintainer: <xris_pop@yahoo.ca>
_pkgname=raritynetwork-screenshot-util
pkgname=$_pkgname-git
pkgver=3.0.1.r0.g493b680
pkgrel=1
pkgdesc="This is a command-line tool that takes a screenshot using either PNG, APNG or JPEG and uploads it to Utils.Rarity.Network"
arch=('any')
url="https://gitgud.io/rarity/RarityNetwork-Screenshot-Util"
license=('custom:The Unlicense')
depends=('maim' 'slop' 'curl' 'xsel' 'mozjpeg-opt' 'zopflipng-git')
optdepends=('torsocks: upload images through Tor' 'ffmpeg: upload animated screenshots')
options=('!strip')
source=("git+https://gitgud.io/rarity/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 screenshot "$pkgdir"/usr/bin/screenshot
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
