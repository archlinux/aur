# Maintainer: Ilias Stamatis <stamatis.iliass at gmail dot com>

pkgname=systemd-denotify
pkgver=r441.3e0887d
pkgrel=1
pkgdesc='A set of python classes that provide desktop notification upon a user login and when a systemd service fails.'
arch=(any)
url='https://github.com/gkarakou/systemd-denotify'
license=('GPL')
depends=('python2' 'python2-dbus' 'python2-gobject' 'python2-pyinotify' 'python2-systemd' 'python2-notify' 'libnotify')
makedepends=('git' 'python2-setuptools')
backup=('etc/systemd-denotify.conf')
install=systemd-denotify.install
source=("${pkgname}::git+https://github.com/gkarakou/systemd-denotify")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="${pkgdir}/"
}
