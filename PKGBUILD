# Maintainer: David Manouchehri <d@32t.ca>

pkgname=gimp-plugin-imgur-git
_gitname=gimp_imgur
_gitbranch=master
_gitauthor=utecht
pkgver=r11.027a23c
pkgrel=1
pkgdesc="A very simple gimp plugin to upload the current image anonymously to imgur."
license=('GPL')
arch=('i686' 'x86_64')
url="https://github.com/$_gitauthor/$_gitname"
depends=('gimp')
source=("git://github.com/$_gitauthor/$_gitname.git#branch=$_gitbranch")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir"/usr/lib/gimp/2.0/plug-ins
  install -m 0755 "$srcdir/$_gitname/"*".py" "$pkgdir"/usr/lib/gimp/2.0/plug-ins
}
