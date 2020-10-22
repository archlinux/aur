# Maintainer: dr34m/KarlFiabeschi 1984itsnow[at]gmail[dot]com

pkgname=keep
pkgver=2.9
pkgrel=2
pkgdesc="A Meta CLI toolkit : Personal shell command keeper"
arch=('any')
url="https://github.com/OrkoHunter/keep"
license=('MIT')
depends=('python-setuptools' 'python-click' 'python-requests' 'python-tabulate' 'python-terminaltables' 'python-pygithub')
source=("https://pypi.io/packages/source/k/keep/keep-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/OrkoHunter/keep/master/LICENSE.md")
sha1sums=('b81252f05b8e21cb4fbf0319153c233243c4349f'
         '07b3e631d4a0653c802d196bfef7dc06a74d9c5c')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 "$srcdir"/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
