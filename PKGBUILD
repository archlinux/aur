# Contributor: wszqkzqk <wszqkzqk@gmail.com>
pkgname=bcloud
pkgver=20170628
pkgrel=1
pkgdesc="Baidu Pan client for Linux Desktop users"
url="https://github.com/Yufeikang/bcloud"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('python' 'python-keyring' 'python-urllib3' 'python-gobject'  'python-dbus'  'python-cssselect' 'python-lxml' 'python-crypto' 'python-pyinotify' 'libappindicator-gtk3' 'libnotify')
source=('git+https://github.com/Yufeikang/bcloud.git')
md5sums=(SKIP)
conflicts=("bcloud-git")

pkgver() {
  cd  "$srcdir/$pkgname/"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd  "$srcdir/$pkgname/"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
}

