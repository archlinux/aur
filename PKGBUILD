# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=diakonos
pkgver=0.9.7
pkgrel=2
pkgdesc="A Linux editor for the masses."
arch=('any')
depends=('ruby-curses')
license=('MIT')
url="http://github.com/Pistos/diakonos"
source=("$pkgname-$pkgver.tar.gz::https://github.com/Pistos/diakonos/archive/v$pkgver.tar.gz")
sha256sums=('77b7f2d2ba29c3a72fff85c91038e19c40eef8a162945105bad203c065c554f9')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's+sitelibdir+vendorlibdir+' install.rb
}

package() {
  cd $pkgname-$pkgver
  ruby install.rb --dest-dir $pkgdir --prefix /usr --conf-dir /etc
  install -D -m644 LICENCE "$pkgdir"/usr/share/licenses/$pkgname/MIT
}

