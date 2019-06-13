# Maintainer: <xris_pop@yahoo.ca>
_pkgname=shr-moe-screenshot
pkgname=$_pkgname-git
pkgver=1.0.2.r0.7e153b41
pkgrel=1
pkgdesc="This is a command-line tool that takes a regular screenshot using either PNG, JPG, or a video capture using MP4, WebM, APNG and uploads it to shr.moe"
arch=('any')
url="https://git.sr.ht/~loli/shr-moe-screenshot"
license=('custom:The Unlicense')
depends=('maim' 'slop' 'curl' 'xsel' 'bc')
replaces=('raritynetwork-screenshot-util-git')
conflicts=('raritynetwork-screenshot-util-git')
optdepends=('torsocks: Upload images through Tor' 'ffmpeg: Upload animated screenshots' 'mozjpeg: Better jpeg compresion. Highly recomended'  'zopflipng-git: Better png compresion')
options=('!strip')
source=("git+https://git.sr.ht/~loli/$_pkgname")
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
