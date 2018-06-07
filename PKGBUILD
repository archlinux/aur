#Maintainer: jnanar <info@agayon.be>

pkgname=python2-kivy-garden
pkgver=0.1.4
pkgrel=1
pkgdesc="The kivy garden installation script, split into its own package for convenient use in buildozer."
arch=(any)
url="https://kivy.org/docs/api-kivy.garden.html"
license=('MIT')
depends=('python2')
options=(!emptydirs)
#optdepends=('')

source=('https://github.com/kivy-garden/garden/archive/0.1.4.tar.gz')
_gitname="garden"
version=0.1.4
sha512sums=('69b8fa2e2e80cc215eaad0eca78e1e207726ef2f611ba328863191580c19e77de970347b206c82927d92fbc821811956f8c45ac3613dafb2db706a491c50585f')

prepare() {
  tar -xzf 0.1.4.tar.gz
}

package() {

  cd "$srcdir/$_gitname-$version"
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
