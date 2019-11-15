# Maintainer: Payson Wallach <payson@paysonwallach.com>

pkgname=aw-client
pkgver=0.8.3
pkgrel=1
pkgdesc="Log what you do on your computer. Simple, extensible, no third parties."
arch=('i686' 'x86_64')
url="https://github.com/ActivityWatch/activitywatch"
license=('MPL2')
groups=()
depends=('python>=3.5.1' 'python-persist-queue' 'python-requests')
makedepends=('python>=3.5.1' 'python-setuptools')
source=("git+https://github.com/ActivityWatch/aw-client.git#commit=a8c9fd7")
md5sums=('SKIP')

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
