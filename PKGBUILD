# Maintainer: Aleksy Grabowski <hurufu@gmail.com>

pkgname=python-timebudget
pkgver=0.7
pkgrel=2
pkgdesc='A stupidly-simple tool to see where your time is going in Python programs'
arch=(any)
url='https://github.com/leopd/timebudget'
license=('Apache')

depends=(
    python
    licenses
)
makedepends=(
    python-pip
)

source=("$pkgname.tar.gz::https://github.com/leopd/timebudget/archive/v$pkgver.tar.gz")
md5sums=('e38eaa05f18ad9c744041ba62497914a')
sha1sums=('edc537854fffcd382adb34ee50175e2ab8b8ef03')

build() {
    cd "${srcdir}/timebudget-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/timebudget-$pkgver"
    python setup.py install -O1 --root="$pkgdir" --skip-build
}
