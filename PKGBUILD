# Maintainer: Francesco Cherchi <frnchr.d9var@slmail.me>
# Contributor: Luke R. <g4jc@openmailbox.org> GPG: rsa4096/3EAE8697

pkgname=xdgmenumaker
pkgver=2.6
pkgrel=1
pkgdesc="A command line tool that generates XDG menus for several window managers"
url="https://github.com/gapan/${pkgname}"
arch=('any')
license=('GPL-3.0-only')
depends=('python-pyxdg' 'python-gobject' 'gtk3')
optdepends=('txt2tags: for manpages' 'python-pillow: for restricting icon size')
source=("${pkgname}-${pkgver}::${url}/archive/${pkgver}.tar.gz")
sha256sums=('ba2e69bd7643b59ddc8a6414e315263703507995caf37dd5aaaa9c2e86cb6dae')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
}

