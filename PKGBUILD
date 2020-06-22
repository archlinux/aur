# Maintainer: Nils Kvist  <robstenklippa@gmail.com>
# Contributor: Nils Kvist <robstenklippa@gmail.com>

pkgname=ssrt
pkgver=2020.06.22.22
pkgrel=1
pkgdesc='simplescreenreocrder - now even simpler'
arch=('any')
url='https://github.com/budlabs/ssrt'
license=('BSD')
groups=()
depends=('bash>=4.0.0')
makedepends=()
optdepends=('xorg-xrandr: get screen geometry'
            'simplescreenrecorder: recording'
            'slop: set recording geometry')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url/archive/$pkgver.tar.gz")
noextract=()
sha256sums=('61d8e7da155d57e27d2396c68c87b49e6aa867be30263ab9b42070092fd96135')

package() {
  ls
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
