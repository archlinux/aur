# Maintainer: sudokode <sudokode@gmail.com>

pkgname=elmer
pkgver=1.0.2.r0.gfb6fc12
pkgrel=1
pkgdesc="Robust frontend to wget and/or curl for various pastebin services"
arch=('any')
url="http://github.com/sudokode/elmer"
license=('custom:SPL')
makedepends=('git')
depends=('perl>=5.10' 'perl-uri')
optdepends=('wget: pasting with wget'
            'xclip: reading from and printing to X buffer')
source=("$pkgname::git://github.com/sudokode/elmer-old.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname

  install -D -m755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -D -m755 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
