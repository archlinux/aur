# Maintainer: Nikolai Käck nikolaikack@icloud.com
pkgname=passly
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI toolkit for auditing and cleaning exported password manager data"
arch=('any')
url="https://github.com/nikooozzz/passly"
license=('MIT')
depends=('python' 'python-tldextract')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
keywords=('password' 'security' 'cli' 'bitwarden' 'passly')
source=("https://github.com/nikooozzz/passly/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fb36c0eb75ab3b7d08093e0189dda2d7db1e3c903c44bcfc6c103468c1afaeab')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}