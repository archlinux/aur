# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Sergey Mastykov

pkgname=linkchecker
pkgver=10.0.1
pkgrel=1
pkgdesc="Check websites for broken links."
arch=('any')
url="https://github.com/linkcheck/linkchecker"
license=('GPL2')
makedepends=('python-pytest')
depends=(
    'python-requests'
    'python-dnspython'
    'python-xdg'
    'python-beautifulsoup4'
)
optdepends=(
    'python-argcomplete: For command-line completion'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/linkchecker/linkchecker/archive/v$pkgver.tar.gz")
sha256sums=('81641ac8794d355585fa8807b525a868e7ff13a4d85d04c2aba13e2a25e71484')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

# Upstream tests need to be fixed first
#check() {
#    cd "$pkgname-$pkgver" && python setup.py test
#}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
