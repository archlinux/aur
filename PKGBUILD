# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Michael Fellinger <m.fellinger@gmail.com>
pkgname=diakonos
pkgver=0.9.4
pkgrel=1
pkgdesc="A Linux editor for the masses."
arch=('any')
depends=('ruby' 'ruby-curses')
license=('MIT')
url="http://diakonos.pist0s.ca/"
source=("http://diakonos.pist0s.ca/archives/$pkgname-$pkgver.tar.bz2")
md5sums=('13cb28073bcd5e4ccf278fedaca829a4')

package() {
  cd $srcdir/$pkgname-$pkgver

  # give system ruby preference.
  ruby=$(test -x /usr/bin/ruby && echo /usr/bin/ruby || which ruby)

  $ruby install.rb --dest-dir $pkgdir --prefix /usr --conf-dir /etc
  install -D -m644 LICENCE $pkgdir/usr/share/licenses/$pkgname/MIT
}

