# Maintainer: robertfoster
# Contributor: c-mauderer

pkgname=hyde-git
pkgver=601.685b288
pkgrel=1
pkgdesc="Hyde is a static website generator powered by Python & Django."
url="https://hyde.github.io/"
arch=(any)
license=('MIT')
depends=('python2' 'python2-commando-git' 'python2-distribute' 'python2-markdown' 'python2-django' 'python2-yaml' 'python2-pyrss2gen' 'python2-cherrypy' 'python2-pygments' 'python2-fswrap-git' 'python2-jinja' 'python2-typogrify' 'python2-commando' 'python2-smartypants')
makedepends=('python2' 'git')
conflicts=(hyde)
source=('hyde::git://github.com/hyde/hyde.git'
        '0001-Allow-higher-versions-of-some-packages.patch')

prepare() {
   cd hyde
   git am "${srcdir}/0001-Allow-higher-versions-of-some-packages.patch"
}

package() {
   cd hyde
   python2 setup.py install --root=$pkgdir/ --optimize=1
}

pkgver() {
  cd hyde
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         '7d16362ebdbba1a06641295466880b71')
