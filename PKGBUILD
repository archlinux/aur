#Maintainer: Robosky <fangyuhao0612@gmail.com>
# Contributor: wxg <wxg4net@gmail.com>

pkgname=bcloud-git
pkgver=20190711
pkgrel=1
pkgdesc="Baidu Pan client for Linux Desktop users"
url="https://github.com/poplite/bcloud"
arch=('any')
license=('GPL3')
makedepends=('git')
depends=('python' 'python-keyring' 'python-urllib3' 'python-gobject'  'python-dbus'  'python-cssselect' 'python-lxml' 'python-crypto' 'python-pyinotify' 'libappindicator-gtk3' 'libnotify')
source=("git+${url}")
md5sums=(SKIP)
conflicts=("bcloud")

pkgver() {
  cd  "${srcdir}/"bcloud
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

package() {
  cd  "${srcdir}/"bcloud
  python setup.py install --prefix=/usr --root="${pkgdir}" || return 1
}
