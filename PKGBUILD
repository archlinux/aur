# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=ldapconsole-git
_pkgname="${pkgname%-git}"
pkgver=2.1.0.r1.g3a55822
pkgrel=1
pkgdesc="Script allows you to perform custom LDAP requests to a Windows domain."
arch=('any')
url="https://github.com/p0dalirius/ldapconsole"
license=(custom)
depends=('python'
         'python-ldap3'
         'python-pycryptodome'
         'python-sectools'
         'python-xlsxwriter')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -Dm0755 $srcdir/$_pkgname/ldapconsole.py "$pkgdir/usr/bin/$_pkgname"
}

