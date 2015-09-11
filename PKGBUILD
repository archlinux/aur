# Maintainer: Chase Franklin <jakhead at gmail dot com>
pkgname=packy
pkgver=0.1.2
pkgrel=3
pkgdesc="pacman updates for conky via rss"
arch=('any')
url="https://github.com/gnullbyte/packy"
license=('GPL')
depends=('expac' 'python-setuptools' 'python-feedparser' 'python-xdg')
options=(!emptydirs)
install='packy.install'
source=("https://github.com/gnullbyte/$pkgname/tarball/$pkgver")
md5sums=("85b907112033d08151d021788df62484")

package() {
	cd "$srcdir/gnullByte-$pkgname-e782eff"
	python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
        install -d "$pkgdir"/usr/local/share/${pkgname}
        cp -af conkyrc "${pkgdir}"/usr/local/share/${pkgname}/
}



