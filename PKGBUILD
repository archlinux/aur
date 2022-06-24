# Maintainer: Agustin Cisneros <agustincc@tutanota.com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=ponymix-git
_pkgname=ponymix
pkgver=5.r4.g83c6557
pkgrel=1
pkgdesc="CLI PulseAudio Volume Control"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/ponymix"
license=('MIT')
depends=('pulseaudio')
optdepends=('libnotify: desktop volume notifications')
makedepends=('git')
conflicts=('ponymix')
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/falconindy/ponymix.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim: ft=sh syn=sh et
