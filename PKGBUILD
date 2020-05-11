_name=${pkgname#python-}
pkgname=python-itunespy
pkgver=1.5.5
pkgrel=1
pkgdesc="itunespy is a simple library to fetch data from the iTunes Store API made for Python 3.X."
arch=('any')
source=("https://files.pythonhosted.org/packages/44/c9/88c9b60699ef8e6fad710fcb09352f842298bdf97c110e8279f1d22f292b/itunespy-1.5.5.tar.gz"
        "https://raw.githubusercontent.com/sleepyfran/itunespy/master/LICENSE")
md5sums=("ee0d4033b9ccaaf8a322a79c08cf1829"
         "2d937713dac0bcc34ae777826b7d21a5")
url="https://github.com/sleepyfran/itunespy"
license=('MIT')
depends=(python python-requests)
build() {
    cd $srcdir/itunespy-$pkgver
    python setup.py build
}

package() {
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd $srcdir/itunespy-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
   
}
