# Maintainer: Milk Brewster <milk on freenode>
_pkgname=patroneo
pkgname=${_pkgname}-git
pkgver=2.4.1
pkgrel=1
pkgdesc="Easy Pattern Sequencer - Utilizing Jack Midi and the Non Session Manager"
arch=(any)
url="https://www.laborejo.org/patroneo/"
license=('GPL3')
groups=('pro-audio')
depends=('libcalfbox-lss' 'hicolor-icon-theme' 'python' 'python-pyqt5' 'ttf-dejavu')
makedepends=()
optdepends=('new-session-manager: for session management'
            'raysession-git: alternative to non-session-manager')
provides=('patroneo' 'patroneo-git')
conflicts=('patroneo' 'patroneo-git')
install=
source=("https://hilbricht.net/downloads/lss//${_pkgname}-${pkgver}.tar.gz")
noextract=()
sha512sums=('f3b9b17cddd467ff94d9aa592b3696b6e5dfc2c64e5243f8ce05e513d9454fd858ccabcf9e778a46e3cdf334c45455bdde258c3fa185a9be3774fd2f5937ef7f')

prepare() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
}

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  make
}

package() {
  make DESTDIR="$pkgdir" install -C "$srcdir/${_pkgname}-${pkgver}"
}
