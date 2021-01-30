# Maintainer: dr34m/KarlFiabeschi 1984itsnow[at]gmail[dot]com
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=keep
pkgver=2.10
pkgrel=1
pkgdesc="A Meta CLI toolkit : Personal shell command keeper"
arch=('any')
url="https://github.com/OrkoHunter/keep"
license=('MIT')
depends=('python-setuptools' 'python-click' 'python-requests' 'python-tabulate' 'python-terminaltables' 'python-pygithub')
source=("https://pypi.io/packages/source/k/keep/keep-$pkgver.tar.gz"
        "$pkgname-LICENSE.md::https://raw.githubusercontent.com/OrkoHunter/keep/master/LICENSE.md")
sha1sums=('e083ff12532a178c636059f77ecb1c950e3fe317'
          '07b3e631d4a0653c802d196bfef7dc06a74d9c5c')

package() {
   cd "$srcdir/$pkgname-$pkgver"
   python setup.py install --root="$pkgdir/" --optimize=1
   install -D -m644 "$srcdir/$pkgname-LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
