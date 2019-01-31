# Maintainer: Michael Taboada <michael@2mb.solutions>
# Contributor: Kelly Prescott <kprescott@coolip.net>
# Contributor: Kyle <kyle@gmx.ca>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>

pkgname=talkingarch-git
pkgver=0.0
pkgrel=1
pkgdesc="Builds TalkingArch, an unofficial Arch Linux live CD with speech and braille support added"
arch=('x86_64')
url="https://talkingarch.tk/"
license=('GPL')
depends=(archiso-git)
makedepends=(git sox opus-tools)
provides=(talkingarch)
conflicts=(talkingarch)
source=(git+https://gitlab.com/talkingarch/talkingarch.git)
md5sums=('SKIP')

pkgver() {
	cd talkingarch
	# cutting off 'v' prefix that presents in the git tag
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

package() {
	cd talkingarch
	make DESTDIR="$pkgdir" install
}
