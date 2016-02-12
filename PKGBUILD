# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=sshexport
pkgver=2.2
pkgrel=1
pkgdesc="Install your ssh keys on remote sites"
arch=('any')
url="http://www.catb.org/~esr/$pkgname"
license=('BSD')
depends=('python' 'openssh')
makedepends=('xmlto' 'docbook-xsl')
replaces=('ssh-installkeys')
source=(http://www.catb.org/~esr/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('14572ae2eb95b4cf1b00aaa06f9400ec0a653413b6e32fbf8fd79071ee405cc0')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make $pkgname.1
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 $pkgname.1 "${pkgdir}"/usr/share/man/man1/$pkgname.1
  install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
}
