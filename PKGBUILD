# Maintainer: Seth Barberee <seth.barberee@gmail.com>
pkgname=gtk-theme-dark-arc-git
_pkgname=Dark-Arc
_pkgauthor=SethBarberee
pkgver=r53.4d788a4
pkgrel=1
pkgdesc="A dark green reskin of Arc GTK-Theme"
arch=('any')
url="https://github.com/SethBarberee/${_pkgname}"
license=('unknown')
groups=()
makedepends=('git')
install=
source=(${_pkgname}::"git+https://github.com/SethBarberee/${_pkgname}.git")
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver(){
  cd "${srcdir}/${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}"
  find Dark-Arc* -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}

# vim:set ts=2 sw=2 et:
