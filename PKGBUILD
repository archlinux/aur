# Maintainer: János Illés <ijanos gmail com>
pkgname=python2-onedrive-git
pkgver=r127.9d5f00f
pkgrel=1
pkgdesc="Python and command-line interface for MS OneDrive (formerly known as SkyDrive)"
arch=('any')
url="https://github.com/mk-fg/python-onedrive"
license=('WTFPL')
depends=('python2' 'python2-requests' 'python2-yaml' 'python2-chardet' 'python2-setuptools')
makedepends=('git')
provides=('python2-onedrive')
conflicts=('python2-onedrive')
options=(!emptydirs)
source=("$pkgname"::'git://github.com/mk-fg/python-onedrive.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
