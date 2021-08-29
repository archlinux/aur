#Maintainer: Arnaud Joset <info [AT] agayon [DOT] be>

pkgname=('libervia-templates-hg')
_realname=libervia-templates
pkgver=0.7.r338.a90baa4d3ed1
_version=0.7
pkgrel=1
url="https://salut-a-toi.org/"
pkgdesc="sat-templates is a collection of templates for Salut à Toi, the multi-frontends multi-purposes XMPP client (core). For now, it needs to be accessible in the PYTHONPATH"

arch=('any')
depends=('python' 'python-jinja')
makedepends=('mercurial')
conflicts=('sat-templates' 'sat-templates-hg')
provides=('libervia-templates')
license=('AGPL3')
source=("hg+https://repos.goffi.org/libervia-templates")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$_realname"
  printf "$_version.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package(){
  cd "$srcdir/$_realname"
  python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1
}
