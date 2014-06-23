# Maintainer: James An <james@jamesan.ca>
# Contributor: Jeff <jecxjo@sdf.lonestar.org> 
_pkgname=geeknote
pkgname=$_pkgname-git
pkgver=r205.192a0c5
pkgrel=1
pkgdesc="Work with Evernote from command line"
arch=(any)
url="http://www.geeknote.me"
license=('GPL')
depends=('python2' 'python2-setuptools' \
         'thrift-python2' 'python2-beautifulsoup4' 'python-markdown2' \
         'python2-sqlalchemy' 'python2-html2text' 'python2-oauth2' \
         'evernote-sdk-python-git')
makedepends=('git')
provides=($_pkgname)
conflicts=()
replaces=()
backup=()
source=("$_pkgname::git://github.com/VitaliyRodnenko/$_pkgname.git")
options=(!emptydirs)
install=
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$_pkgname"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
