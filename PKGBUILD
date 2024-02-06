# Maintainer: Pravin Ramana <pravinramana25 at protonmail dot ch>

pkgname=python-tinygrad
_name=${pkgname#python-}
pkgver=0.8.0
pkgrel=1
pkgdesc="You like pytorch? You like micrograd? You love tinygrad! <3"
arch=('any')
url="https://github.com/tinygrad/tinygrad"
license=('MIT')
depends=('python>=3.8' 'python-tqdm' 'python-gpuctypes')
optdepends=('python-llvmlite: LLVM Backend Support'
            'python-unicorn: ARM Backend Support'
            'python-triton: Triton Backend Support'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('009441986dc5f2ab48a3a6c7ecf6c92dda0684969d8c3469e131129bbf186777')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
