# Maintainer: Corey Mwamba <contact.me@coreymwamba.co.uk>
pkgname=estonta-git
_pkgname=estonta
pkgver=r49.36f15db
pkgrel=1
pkgbase=estonta-git
pkgdesc="A simple Bash and Yad-based appointment system."
arch=('i686' 'x86_64')
url="https://github.com/coreymwamba/estonta"
license=('GPL')
optdepends=('yad:	graphical interface')
makedepends=('git')
source=('git://github.com/coreymwamba/estonta')
install='estonta-git.install'
md5sums=('SKIP')
pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/etc
  cd "$_pkgname"
install -p -D estonta -m755 $pkgdir/usr/bin/estonta
install -p -D estonta.conf -m644 $pkgdir/etc/estonta.conf
install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
