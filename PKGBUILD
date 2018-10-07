# Maintainer: Piotr Miller <nwg.piotr@gmail.com>
pkgname=('one-more-cheese')
pkgver=0.1.7
pkgrel=2
pkgdesc="Arcade-puzzle game"
arch=('i686' 'x86_64')
url="http://nwg.pl/cheese"
license=('freeware')
depends=('python' 'python-pygame' 'python-requests' 'python-setuptools')
source=("http://nwg.pl/mice/download/one-more-cheese-0.1.7.tar.gz"
"http://nwg.pl/mice/download/one-more-cheese"
"http://nwg.pl/mice/download/one-more-cheese.desktop"
"http://nwg.pl/mice/download/one-more-cheese.png")

md5sums=('b970e85495df3ede018aabc23b2d5754'
         '20dd11dadba799472f6fefbf105f01de'
         '8c44865338673c7a9ff646d23af1b172'
         '15b45413c215260baf7c462cbbdde183')

package() {
  install -D -m 755 one-more-cheese \
 	 "$pkgdir"/usr/bin/one-more-cheese
 	install -D -m 755 one-more-cheese.desktop \
 	 "$pkgdir"/usr/share/applications/one-more-cheese.desktop
 	install -D -m 644 one-more-cheese.png \
 	 "$pkgdir"/usr/share/one-more-cheese/one-more-cheese.png
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
