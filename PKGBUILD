# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Jarek Sedlacek <jareksedlacek@gmail.com>

pkgname=batterymon-clone
pkgver=1.4.3
pkgrel=1
pkgdesc="A simple battery monitor tray icon using acpi"
arch=('any')
url="https://github.com/jareksed/batterymon-clone"
license=('GPL')
groups=()
depends=('python2' 'pygtk' 'python2-distutils-extra')
makedepends=('git')
optdepends=('python2-notify' 'notification-daemon')

provides=('batterymon')
conflicts=('batterymon')

source=("$pkgname"::'git://github.com/JarekSed/batterymon-clone.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # Use the tag of the last commit
    git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
