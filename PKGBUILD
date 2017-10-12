# Maintainer: dr34m/KarlFiabeschi 1984itsnow[at]gmail[dot]com

pkgname=keep
pkgver=2.4.2
pkgrel=1.3
pkgdesc="A Meta CLI toolkit : Personal shell command keeper"
arch=('any')
url="https://github.com/OrkoHunter/keep"
license=('MIT')
depends=('python-setuptools' 'python-click' 'python-requests' 'python-tabulate' )
source=("https://pypi.io/packages/source/k/keep/keep-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/OrkoHunter/keep/master/LICENSE.md")
sha1sums=('48b302f2ec7e811466a58d9c6ccfd7f755655105' 
         '07b3e631d4a0653c802d196bfef7dc06a74d9c5c')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 "$srcdir"/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
