# Maintainer: Popolon <popolon at popolon dot org>
# Contributor: Mike Nagie <echo 'cHJvbWlrZTE5ODdAZ21haWwuY29tCg==' | base64 -d>
# Contributor: Ingo Gottwald <in dot gottwald at gmail dot com>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=python2-msrplib
pkgver=0.19.0
pkgrel=3
pkgdesc="A python MSRP client library, implements RFC4975 and RFC4976"
license=('custom:MIT')
arch=('any')
url="http://download.ag-projects.com/MSRP"
depends=('python2-application>=1.5.0' 'python2-gnutls' 'python2-zope-interface' 'python2-twisted')
source=("http://download.ag-projects.com/MSRP/${pkgname/2}-$pkgver.tar.gz")
md5sums=('41ace0d9dc4454f652ae826073450ebe')

build() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/${pkgname/2}-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1

  # license
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

