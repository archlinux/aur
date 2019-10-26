#Maintainer: Arnaud Joset <info [AT] agayon [DOT] be>

pkgname=('sat-templates-hg')
_realname=sat_templates
pkgver=0.7.r223.5db3aacee4a3
_version=0.7
pkgrel=1
url="https://salut-a-toi.org/"
pkgdesc="sat-templates is a collection of templates for Salut à Toi, the multi-frontends multi-purposes XMPP client (core). For now, it needs to be accessible in the PYTHONPATH"

arch=('any')
depends=('python' 'python-jinja')
makedepends=('mercurial')
conflicts=('sat-templates')
provides=('sat-templates')
license=('AGPL3')
source=("hg+https://repos.goffi.org/sat_templates")
md5sums=('SKIP')
options=('!strip')

pkgver() {
  cd "$_realname"
  printf "$_version.r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$_realname"
  python2 setup.py build
}

package(){
  cd "$srcdir/$_realname"
  python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1  --skip-build
}
