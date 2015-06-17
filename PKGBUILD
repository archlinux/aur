# Maintainer: M0Rf30

pkgname=archweb-git
pkgver=1911.ffaa2cf
pkgrel=1
pkgdesc="Arch website code"
arch=('i686' 'x86_64')
url="http://projects.archlinux.org/archweb.git/"
license=('GPL')
depends=('python2-django' 'python2-south' 'python2-bencode' 'python2-memcached' 'python2-pyinotify' 'python2-psycopg2' 'python2-markdown' 'python2-pytz' 'pgpdump-git')
makedepends=('git')
install=$pkgname.install
source=('archweb::git://projects.archlinux.org/archweb.git')

package() {
  mkdir -p $pkgdir/srv/http
  cp -r archweb $pkgdir/srv/http/
  rm -r $pkgdir/srv/http/archweb/.git*
}

pkgver() {
  cd archweb
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP')
