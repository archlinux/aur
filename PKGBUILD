pkgname=cherrytree-bin
basename=${pkgname%*-bin}
pkgver=0.39.2
pkgrel=1
pkgdesc='Binary version of cherrytree'
arch=('any')
url='https://www.giuspen.com/cherrytree/'
license=('GPL3')
depends=('pygtksourceview2' 'python2-dbus')
optdepends=('python2-pyenchant: for spell checking support' 'p7zip: for password protection support')
source=(http://www.giuspen.com/software/$basename\_$pkgver-0_all.deb)
sha256sums=('c1628b72d4b675f5cadab55887dbbb46204a8eedc22926b322d281e20902d2c9')

package() {
	msg2 "Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	msg2 "Patching Python version..."
	sed -i '1s/on/on2/' "$pkgdir"/usr/bin/cherrytree
}

