# Maintainer: Morten Linderud <morten@linderud.pw>

pkgname=jottalib
pkgver=0.5.1
pkgrel=1
pkgdesc="A library to access files stored at jottacloud.com"
arch=("any")
url="https://github.com/havardgulldahl/jottalib"
license=('GPL3')
depends=('python2-requests'
         'python2-requests-toolbelt'
         'python2-certifi'
         'python2-dateutil'
         'python2-humanize'
         'python2-six'
         'python2-chardet')
source=("$pkgname.tar.gz::https://github.com/havardgulldahl/jottalib/archive/v0.5.1.tar.gz")
sha256sums=('607e5270c15e593e0df494493d371d996053d45cfc2fe44a09020719fe5feaa3')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
