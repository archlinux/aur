# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ircii
pkgver=20260115
pkgrel=1
pkgdesc='IRC and ICB client that runs under most UNIX platforms.'
arch=('i686' 'x86_64')
url='http://www.eterna23.net/ircii/'
license=('BSD-Source-Code')
depends=('lftp' 'ncurses')
conflicts=('ircii-current')
source=("http://ircii.warped.com/$pkgname-$pkgver.tar.gz")
md5sums=('32c97374c4c1fc282aa0a19a2b03427c')
sha1sums=('91c04f8b57e9e69e1a8f1cba01868def18e2acd2')
sha256sums=('380aabd8aa42743b51489f6b7dfeb2355bf45e36800c369e8a566c8f2fc9376e')
sha512sums=('318ea2eabc6c8aac331842eed450813788e9d5bb7f6789f0d145c8ec2b88b3a04d1cecb1f86b5997d768f40665ccc34b3e34995dd42e786a795141ea37796979')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" libexecdir="$pkgdir/usr/bin" mandir="$pkgdir/usr/share/man/man1" install
	install -D -m644 doc/Copyright $pkgdir/usr/share/licenses/$pkgname/COPYRIGHT
}
