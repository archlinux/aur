# Maintainer: Chase Franklin <jakhead at gmail dot com>
pkgname=packy
pkgver=0.1.3
pkgrel=1
pkgdesc="pacman updates for conky via rss"
arch=('any')
url="https://github.com/gnullbyte/packy"
license=('GPL')
depends=('expac' 'python-setuptools' 'python-feedparser' 'python-xdg')
options=(!emptydirs)
install='packy.install'
source=("https://github.com/gnullbyte/$pkgname/tarball/$pkgver")
md5sums=("027f304134989468a67befe884316b35")

package() {
	cd "$srcdir/gnullByte-$pkgname-a2e4d88"
	python setup.py install --prefix=/usr --root=$pkgdir --optimize=1
        install -d "$pkgdir"/usr/local/share/${pkgname}
        cp -af conkyrc "${pkgdir}"/usr/local/share/${pkgname}/
}




