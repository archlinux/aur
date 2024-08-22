# Maintainer: Pravin Ramana <pravinramana25 at protonmail dot ch>

pkgname=python-tinygrad
_name=${pkgname#python-}
pkgver=0.9.2
pkgrel=1
pkgdesc="You like pytorch? You like micrograd? You love tinygrad! <3"
arch=('any')
url="https://github.com/tinygrad/tinygrad"
license=('MIT')
depends=('python>=3.8' 'python-tqdm' 'python-numpy')
optdepends=('python-llvmlite: LLVM Backend Support'
            'python-unicorn: ARM Backend Support'
            'python-triton: Triton Backend Support'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f1ff5d61c9666e624a66b4c88d16e9a90327967825bed782958687291652d3b2')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
