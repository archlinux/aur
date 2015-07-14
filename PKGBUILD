# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
pkgname=python-pyjavaproperties
_pkgname=pyjavaproperties
pkgver=0.6
pkgrel=1
pkgdesc="Python replacement for java.util.Properties."
arch=('any')
url="https://pypi.python.org/pypi/pyjavaproperties"
license=('PSF')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/${pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
        pyjavaproperties-python3.patch)
md5sums=('e459c21668937a06335e3a2ed77efa22'
         '51aa70dfbfb86aa7ab6b05b22d124fcb')

prepare() {
  cd "$_pkgname-$pkgver"
  patch -p1 -i "$srcdir"/pyjavaproperties-python3.patch
}

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
