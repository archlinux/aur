# Maintainer: Cyker Way <cykerway at gmail dot com>
# Contributor: Firef0x <Firefgx {at) gmail [dot} com>

pkgname=aafm-git
pkgver=20140930
pkgrel=1
pkgdesc="Android ADB File Manager."
arch=(any)
url="https://github.com/sole/aafm"
license=('GPL3')
depends=('python2' 'pygtk' 'android-sdk-platform-tools')
makedepends=('git' 'desktop-file-utils')
provides=('aafm')
conflicts=('aafm')
install="${pkgname}.install"
source=("${pkgname}::git://github.com/sole/aafm.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --pretty=format:%cd --date=short | sed 's/-//g'
}

package() {
  cd "$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
