# Maintainer: Oliver Kuster <oliver.kuster[at]gmail[dot]com>
pkgname=phablet-tools
pkgver=1.1+14.10.20141010
pkgrel=3
pkgdesc="Tools to install Ubuntu Touch on Nexus Devices"
url="https://launchpad.net/~phablet-team"
arch=('any')
license=('GPL2')
depends=('android-tools' 'python2-configobj' 'python2-pyliblzma' 'python2-requests' 'python2-xdg' 'python2-six' 'sudo' 'repo')
makedepends=('python2-setuptools')
# options='!emptydirs'
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz")
md5sums=('d5838733df3b0c1625c7034c4af0b6ec')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/python/python2.7/g' phabletutils/settings.py
}

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
  mv $pkgdir/usr/bin/repo $pkgdir/usr/bin/repo.phablet-tools
}
