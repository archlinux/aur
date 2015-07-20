# Maintainer: Kelly Prescott <kprescott@coolip.net>
# Contributor: Kyle <kyle@gmx.ca>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
pkgname=talkingarch-git
_gitname=talkingarch
pkgver=20150501
pkgrel=1
pkgdesc="Builds TalkingArch, an unofficial Arch Linux live CD with speech and braille support added"
arch=('any')
url="http://talkingarch.tk/"
license=('GPL')
depends=(archiso-git)
# I don't want folks using archiso from extra, since it's old.
makedepends=(git sox opus-tools)
provides=(talkingarch)
conflicts=(talkingarch)
source=(git+https://notabug.org/talkingarch/talkingarch.git)
md5sums=('SKIP')

#pkgver() {
#  cd $_gitname
#  # Use the tag of the last commit
#  git describe --always | sed -e 's|v||' -e 's|-|.|g'
#}

package() {
  cd "${_gitname}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
