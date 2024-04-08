# Maintainer: Arun G <lunar.arun@gmail.com>

pkgname=stylepak-git
pkgver=16.124fbdc
pkgrel=1
arch=('any')
url="https://github.com/refi64/stylepak"
pkgdesc="Automatically install your host GTK+ theme as a Flatpak. Git version."
source=("$pkgname"::'git+https://github.com/refi64/stylepak.git')
md5sums=('SKIP')
depends=('ostree' 'appstream-glib' 'git')
provides=('pakitheme' 'pakitheme-git')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/$pkgname/stylepak"
  install -D -t "$pkgdir/usr/share/licenses/stylepak" "$srcdir/$pkgname/LICENSE"
  install -D -t "$pkgdir/usr/share/doc/stylepak/README.md" "$srcdir/$pkgname/README.md"
}
