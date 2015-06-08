# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgname=mod_ruby
pkgver=1.3.0
pkgrel=1
pkgdesc="Embeds the Ruby interpreter into Apache"
arch=('i686' 'x86_64')
url="http://www.modruby.net/"
license=('Apache')
depends=('apache>=1.3.3' 'ruby>=1.6.4')
install=$pkgname.install
source=(http://www.modruby.net/archive/$pkgname-$pkgver.tar.gz)
md5sums=('5aae358c3c9f1bfa2554da9242289ab7')

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure.rb --with-apxs --with-apr-includes=/usr/include/apr-1 \
                   --prefix=/usr || return 1
    make || return 1
    make DESTDIR=$pkgdir install || return 1
}
