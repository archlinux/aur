# Maintainer: Francesco Cherchi <frnchr.d9var@slmail.me>
# Contributor: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=2.5
pkgrel=1
pkgdesc="A command line tool that generates XDG menus for several window managers"
url="https://github.com/gapan/${pkgname}"
arch=('any')
license=('GPL-3.0-only')
depends=('python-pyxdg' 'python-gobject' 'gtk3')
optdepends=('txt2tags: for manpages' 'python-pillow: for restricting icon size')
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1bce9600e7a9e0190941b748ae65f550690bd193557fc2f074947da3cbfe7667')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

