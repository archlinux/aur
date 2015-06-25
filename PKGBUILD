# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=asciiportal-git
pkgver=20150625
pkgrel=1
pkgdesc="Text based puzzle game inspired by the popular video game."
arch=('i686' 'x86_64')
url="https://github.com/cymonsgames/ASCIIpOrtal"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'pdcurses' 'yaml-cpp')
makedepends=('git')
provides=('asciiportal')
conflicts=('asciiportal' 'asciiportal-mod')
source=("git://github.com/cymonsgames/ASCIIpOrtal.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/ASCIIpOrtal"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd "${srcdir}/ASCIIpOrtal"
  make linux
}

package() {
  cd "${srcdir}/ASCIIpOrtal"
  make DESTDIR="$pkgdir/" install
} 
