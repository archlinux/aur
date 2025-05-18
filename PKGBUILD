# Maintainer: Arun G <lunar.arun@gmail.com>

pkgname=stylepak-git
pkgver=18.0c4b0c1
pkgrel=1
arch=('any')
url="https://github.com/refi64/stylepak"
pkgdesc="Automatically install your host GTK+ theme as a Flatpak. Git version."
source=("$pkgname"::'git+https://github.com/refi64/stylepak.git')
md5sums=('SKIP')
depends=('ostree' 'appstream-glib' 'git')
provides=('pakitheme' 'pakitheme-git')
license=('MPL-2.0')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname/stylepak"
  install -D -t "$pkgdir/usr/share/doc/stylepak" "$srcdir/$pkgname/README.md"
}
