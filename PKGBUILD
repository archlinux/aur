# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: James An <james@jamesan.ca>

pkgname=subbrute
pkgver=1.2.1
_tag=77
pkgrel=3
pkgdesc="A DNS meta-query spider that enumerates DNS records and subdomains"
arch=('any')
url="https://github.com/TheRook/$pkgname"
license=('GPL')
depends=('python-dnspython')
makedepends=('git')
source=("git+https://github.com/TheRook/$pkgname.git#tag=$_tag")
sha512sums=('SKIP')

package() {
  cd $pkgname

  # install upstream files
  install -m755 -d "$pkgdir/usr/share/$pkgname"
  install -m644 -t "$pkgdir/usr/share/$pkgname" resolvers.txt names.txt names_small.txt
  install -m755 -t "$pkgdir/usr/share/$pkgname" subbrute.py
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  # create symlink from /usr/bin
  install -m755 -d "$pkgdir/usr/bin"
  ln -s "/usr/share/$pkgname/$pkgname.py" "$pkgdir/usr/bin/$pkgname"
}
