# Maintainer: Maximilien Di Dio      <mrgamerlix@gmail.com>

pkgname=admin-git
_pkgname_simple=admin
pkgver=1.0
pkgrel=1
pkgdesc="A cli tool to manage easily an archlinux system"
arch=('any')
url="https://gitlab.com/MaximilienLIX/admin"
license=('GPL3')
depends=('sudo')
optdepends=('firefox: To manage profile and sqlite data base.' 'grub' 'syslinux')
makedepends=('git')
source=("git+https://gitlab.com/MaximilienLIX/admin.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package()
{
      install -d "$pkgdir/usr/bin/"
      install -d "$pkgdir/etc/$_pkgname_simple/"
      install -d "$pkgdir/usr/share/man/man1/"

      install -m755 "$srcdir/$_pkgname_simple/src/"{admin,admin-functions.sh} "$pkgdir/usr/bin"
      install -m644 "$srcdir/$_pkgname_simple/conf/admin.rc" "$pkgdir/etc/$pkgname/"
      install -m644 "$srcdir/$_pkgname_simple/doc/admin.1.gz" "$pkgdir/usr/share/man/man1/"
}

