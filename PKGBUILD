# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=gnome-shell-extension-web-search-dialog-git
_pkgname=web-search-dialog
pkgver=r129.40e1acf
pkgrel=1
pkgdesc="Search the web directly from Gnome Shell"
arch=('any')
url="https://extensions.gnome.org/extension/549/web-search-dialog/"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
install='gschemas.install'
source=("git+https://github.com/awamper/web-search-dialog")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"

  for i in $(find -type f); do
    install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/web_search_dialog@awamper.gmail.com/$i
  done
}
