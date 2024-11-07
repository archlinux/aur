# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=finduncommonshares-git
_pkgname="${pkgname%-git}"
pkgver=3.2.r4.g16864c1
pkgrel=1
pkgdesc="Python script allowing to quickly find uncommon shares in vast Windows Domains..."
arch=('any')
url="https://github.com/p0dalirius/finduncommonshares"
license=(custom)
depends=('python'
         'impacket'
         'python-xlsxwriter'
         'python-sectools'
         'python-pycryptodome')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
source=("git+$url")
sha512sums=('SKIP')

# https://wiki.archlinux.org/title/VCS_package_guidelines
pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$_pkgname"
  install -Dm0755 $srcdir/$_pkgname/FindUncommonShares.py "$pkgdir/usr/bin/$_pkgname"
}

