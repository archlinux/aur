# Contributor: wxg <wxg4net@gmail.com>

pkgname=bcloud-git
pkgver=20150609
pkgrel=1
pkgdesc="Baidu Pan client for Linux Desktop users"
url="https://github.com/LiuLang/bcloud"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('python' 'python-keyring' 'python-urllib3' 'python-gobject'  'python-dbus'  'python-cssselect' 'python-lxml' 'python-crypto' 'webkitgtk' 'python-pyinotify')
source=("${pkgname}"::'git+https://github.com/LiuLang/bcloud.git')
md5sums=(SKIP)
conflicts=("bcloud")

pkgver() {
  cd  "$srcdir/$pkgname/"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd  "$srcdir/$pkgname/"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
