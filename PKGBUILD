# Maintainer: erik-pro <aarnaarn2@gmail.com>
# Contributor: Kelly Prescott <kprescott@coolip.net>
# Contributor: Kyle <kyle@gmx.ca>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>

pkgname=talkingarch-git
pkgver=1.1.r0.g1f99984
pkgrel=1
pkgdesc="Builds TalkingArch, an unofficial Arch Linux live CD with speech and braille support added"
arch=('x86_64')
url="https://talkingarch.info/"
license=('GPL')
depends=(archiso-git)
makedepends=(git sox opus-tools)
provides=(talkingarch)
conflicts=(talkingarch)
source=(git+https://github.com/erik-pro/talkingarch.git)
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
