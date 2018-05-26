#Maintainer: jnanar <info [at] agayon [dot] be>

pkgname=sat-cagou-hg
pkgver=r186.a826c70beda2
VERSION=0.7
pkgrel=1
pkgdesc=""
arch=(any)
url=""
license=('AGPL3')
depends=('python2' 'python2-kivy' 'sat-xmpp-hg' 'sat-templates-hg' 'sat-tmp' 'xsel')
makedepends=('git')
options=(!emptydirs)
#optdepends=('')

source=('hg+'https://repos.goffi.org/cagou)
_hgname="cagou"

md5sums=('SKIP')


pkgver() {
 cd "$_hgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}


package() {
cd "$srcdir/$_hgname/"
  # make sure UNICODE characters in the README are parsed correctly
  export LC_CTYPE=en_US.utf-8
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
