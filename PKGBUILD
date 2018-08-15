#Maintainer: jnanar <info [at] agayon [dot] be>

pkgname=sat-cagou-hg
pkgver=r233.ba8f3a4a5ac7
VERSION=0.7
pkgrel=1
pkgdesc=""
arch=(any)
url=""
license=('AGPL3')
depends=('python2' 'python2-kivy' 'sat-xmpp-hg' 'sat-templates-hg' 'sat-tmp-hg' 'xsel' 'python2-kivy-garden')
makedepends=('mercurial')
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
  pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (Android/Desktop interface)"
  garden install contextmenu
  cd "$srcdir/$_hgname/"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
