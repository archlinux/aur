# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=ldapwordlistharvester-git
_pkgname="${pkgname%-git}"
pkgver=1.2.r12.g49ce8b2
pkgrel=1
pkgdesc="Tool to generate wordlist from information present in LDAP, in order to crack passwords of domain accounts."
arch=('any')
url="https://github.com/p0dalirius/ldapwordlistharvester"
license=(custom)
depends=('python'
         'python-pycryptodome'
         'python-sectools>=1.4.1'
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
  install -Dm0755 $srcdir/$_pkgname/LDAPWordlistHarvester.py "$pkgdir/usr/bin/$_pkgname"
}

