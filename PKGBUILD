# Maintainer: Christophe-Marie Duquesne <chmd@chmd.fr>

pkgname=michel-git
pkgdesc="push/pull flat text files to gtasks"
url="http://github.com/chmduquesne/michel"
depends=(
    'python2-google-api-python-client'
    'python2-gflags'
    'python2-httplib2'
    'pyxdg'
    'python2-oauth2')
makedepends=('python2-distribute' 'git')
provides=('michel')
license=('Public Domain')
arch=('any')
pkgver=0.r25.d789243
pkgrel=1
source=("$pkgname"::'git+http://github.com/chmduquesne/michel.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
  chmod +r ${pkgdir}/* -R
}
