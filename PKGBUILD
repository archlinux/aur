# Maintainer: Harriet O'Brien <harrietobrien@protonmail.com>
# Contributor: hiromi-mi <hiromi hyphen mi at cat dot zaq dot jp>
pkgname=python-qulacs
_gives=qulacs
pkgver=0.6.11
pkgrel=1
pkgdesc="Simulate quantum circuits for Python"
arch=('x86_64')
url="https://docs.qulacs.org/"
license=('MIT')
depends=('python')
makedepends=('cmake' 'gcc' 'python-setuptools' 'git')
checkdepends=('python-numpy')

source=("https://files.pythonhosted.org/packages/e7/0f/261c9b3068584a5372c31aa729178722723156dc86f70b45070614dd38aa/$_gives-$pkgver.tar.gz")
# source=("$pkgname-$pkgver.tar.gz::https://github.com/qulacs/qulacs/archive/v${pkgver}.tar.gz")
sha256sums=('3dfa030c6d90e78c8dfe840423a53fb1d7e7e4a63bb7180e1b46a4d25d2c72bf')

build() {
    echo $PWD
    cd "$_gives-$pkgver"
    python setup.py build
}

package() {
    cd "$_gives-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
