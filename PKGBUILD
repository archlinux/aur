# Maintainer: Anthonylucianodev@proton<.me>
pkgname=deepseek-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal CLI client for DeepSeek with file context support"
arch=('any')
url="https://github.com/anthonyluciano/deepseek-cli"
license=('MIT')
depends=('python' 'python-requests' 'python-rich' 'python-tqdm' 'python-dotenv')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/anthonyluciano/deepseek-cli/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
