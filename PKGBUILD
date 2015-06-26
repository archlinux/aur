# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
pkgname=rnnlm
pkgver=0.4b
pkgrel=1
pkgdesc="Recurrent neural network language model"
arch=(i686 x86_64)
url="http://rnnlm.org/"
license=('BSD')
makedepends=(gcc)
checkdepends=()
source=(https://f25ea9ccb7d3346ce6891573d543960492b92c30.googledrive.com/host/0ByxdPXuxLPS5RFM5dVNvWVhTd0U/rnnlm-0.4b.tgz)
md5sums=('2b28c8bd76ea17eae153ed55a1959988') #generate with 'makepkg -g'

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make CC=g++ rnnlmlib.o
	make CC=g++ rnnlm
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 rnnlm "$pkgdir/usr/bin/rnnlm"
}
