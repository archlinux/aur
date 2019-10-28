# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>
pkgname=diakonos
pkgver=0.9.7
pkgrel=1
pkgdesc="A Linux editor for the masses."
arch=('any')
depends=('ruby' 'ruby-curses')
license=('MIT')
url="http://diakonos.pist0s.ca/"
source=("https://github.com/Pistos/diakonos/archive/v$pkgver.tar.gz")
sha256sums=('77b7f2d2ba29c3a72fff85c91038e19c40eef8a162945105bad203c065c554f9')

package() {
  cd $srcdir/$pkgname-$pkgver

  # give system ruby preference.
  ruby=$(test -x /usr/bin/ruby && echo /usr/bin/ruby || which ruby)

  $ruby install.rb --dest-dir $pkgdir --prefix /usr --conf-dir /etc
  install -D -m644 LICENCE $pkgdir/usr/share/licenses/$pkgname/MIT
}

