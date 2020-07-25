# Maintainer: Devin Christensen <quixoten at gmail dot com>
# Maintainer: Aliaksandr Stelmachonak <mail at ava1ar dot me>
pkgname=powerline-fonts-git
pkgver=r202.e80e3eb
pkgrel=1
pkgdesc="Patched fonts for Powerline users"
arch=('any')
url='https://github.com/powerline/fonts'
license=('CPL')
depends=('fontconfig' 'xorg-mkfontscale')
makedepends=('git')
provides=(
  powerline-fonts
  ttf-hack
)
conflicts=(
  powerline-fonts
  otf-droid-sans-mono-powerline-git
  otf-fura-mono-powerline-git
  otf-inconsolata-dz-powerline-git
  otf-inconsolata-g-powerline-git
  otf-inconsolata-powerline-git
  otf-sauce-code-powerline-git
  terminess-powerline-font-git
  ttf-anonymice-powerline-git
  ttf-dejavu-sans-mono-powerline-git
  ttf-droid-sans-mono-dotted-powerline-git
  ttf-droid-sans-mono-slashed-powerline-git
  ttf-hack
  ttf-hack-powerline-git
  ttf-literation-mono-powerline-git
  ttf-monofur-powerline-git
  ttf-ubuntu-mono-derivative-powerline-git
)
install=${pkgname}.install
source=('git+https://github.com/powerline/fonts.git')
sha1sums=('SKIP')

pkgver() {
  cd fonts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/fonts
  find . -iname "*.ttf" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
  find . -iname "*.otf" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
  find . -iname "*.pcf.gz" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/misc/{} \;
  find . -iname "*.psf.gz" -execdir install -Dm644 {} $pkgdir/usr/share/kbd/consolefonts/{} \;
}
