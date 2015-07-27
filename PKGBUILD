# Maintainer:  Alexander Minges <alexander.minges@gmail.com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Andrzej Wąsowski <wasowski@data.pl>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Andrey Vlasovskikh <andrey.vlasovskikh@gmail.com>
# Contributor: Vo Van Hong Ngoc <vhngoc@ubuntu-vn.org>

pkgname=rawdog
pkgver=2.21
pkgrel=1
pkgdesc="RSS Aggregator Without Delusions Of Grandeur"
arch=('any')
url="http://offog.org/code/rawdog.html"
license=('GPL' 'LGPL')
depends=('python2-feedparser')
optdepends=('python2-tidylib: cleaner html output')
install=$pkgname.install
source=(http://offog.org/files/$pkgname-$pkgver.tar.gz)
sha256sums=('0a63b26cc111b0deca441f498177b49be0330760c5c0e24584cdb9ba1e7fd5a6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 config "$pkgdir/usr/share/$pkgname/config"
  install -Dm644 style.css "$pkgdir/usr/share/$pkgname/style.css"
}

# vim:set ts=2 sw=2 et:
