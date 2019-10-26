# Maintainer: David Santiago <demanuel@ymail.com>
pkgname=newsup-git
_pkgname=newsup
pkgrel=1
pkgver=r473.d6f20e6
provides=(${_pkgname})
pkgdesc="NewsUP - A usenet binary uploader"
arch=('any')
url="https://github.com/demanuel/NewsUP"
license=('GPLv3')
depends=('perl>=5.026' 'perl-io-socket-ssl>=2.020' 'perl-inline-c>=0.76' 'perl-config-tiny>=2.22' 'perl-file-copy-recursive>=0.44')
source=("$pkgname::git+$url.git")
md5sums=('SKIP')
makedepends=('git')
install=newsup.install


package() {
	install -D $srcdir/$pkgname/bin/newsup.pl $pkgdir/usr/bin/vendor_perl/$_pkgname
	install -D -m644 $srcdir/$pkgname/conf/newsup.conf $pkgdir/etc/$_pkgname/newsup.conf
  install -D $srcdir/$pkgname/bin/newsup.pl $pkgdir/usr/bin/vendor_perl/$_pkgname
  mkdir -p $pkgdir/usr/share/perl5/vendor_perl/
  cp -R $srcdir/$pkgname/lib/NewsUP/ $pkgdir/usr/share/perl5/vendor_perl/
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
