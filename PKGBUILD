# Contributor: huma
pkgname=tokyocabinet-ruby
pkgver=1.29
pkgrel=1
pkgdesc="Ruby Binding of Tokyo Cabinet DBM"
url="http://tokyocabinet.sourceforge.net"
license=('LGPL')
arch=('i686' 'x86_64')
depends=('ruby' 'tokyocabinet>=1.4')
source=(http://tokyocabinet.sourceforge.net/rubypkg/$pkgname-$pkgver.tar.gz)
md5sums=('e5259b9c9c0368aa88a2accd6f3b9db4')

package() {
	cd $srcdir/$pkgname-$pkgver
	ruby extconf.rb
	make || return 1
	make DESTDIR=$pkgdir install
}
