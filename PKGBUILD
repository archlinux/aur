# Maintainer: Oscar Carballal Prego <oscar@oscarcp.com>
_appname=sshedit-gtk
_reponame=$_appname-master
pkgname=$_appname-git
pkgver=4.a68833e
pkgrel=1
pkgdesc="GTK+ SSH Configuration Editor (GIT version)"
arch=('any')
url="https://github.com/esmorga/sshedit-gtk"
license=('MIT')
depends=('python-pip' 'python-gobject' 'git')
source=("https://github.com/esmorga/sshedit-gtk/archive/master.zip")
md5sums=('SKIP')

package() {
	cd "$_reponame"
	python setup.py install --root=$pkgdir/ --optimize=1
}

pkgver() {
  cd "$_reponame"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}
