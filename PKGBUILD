# Maintainer: Shane Donohoe <shane@donohoe.cc>

pkgname=python-iterfzf
pkgver=0.4.0.17.3
pkgrel=3
pkgdesc="Pythonic interface to fzf, a CLI fuzzy finder"
arch=('any')
url="https://github.com/dahlia/iterfzf"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dahlia/iterfzf/archive/${pkgver}.tar.gz")
sha256sums=('91884eb65aae192461f9bc8ab2b2eaded07f950369e5802599d008bec191ced3')

build() {
    cd "iterfzf-${pkgver}"
    python setup.py test
}

package() {
    cd "iterfzf-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
