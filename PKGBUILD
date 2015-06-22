# Maintainer: Skunnyk <skunnyk@archlinux.fr>
pkgname=gmvault
pkgver=1.9
_pkgver=1.9
pkgrel=1
pkgdesc="Gmvault is a tool for backing up your gmail account and never lose email correspondence."
arch=(any)
url="http://gmvault.org"
license=('AGPL')
depends=('python2' 'python2-logbook' 'python2-chardet' 'python2-imapclient')
makedepends=('python2-distribute')
source=(https://bitbucket.org/gaubert/gmvault-official-download/downloads/gmvault-v${_pkgver}-src.tar.gz use-python2.patch)

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  patch -p1 < ../use-python2.patch
}
 
package() {
  cd "$srcdir/$pkgname-$_pkgver"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}
md5sums=('bf973db5c57d8fa29a8a155ac8c3a75e'
         '7d6b1d651a295d1a9fc00c42af59b02e')
