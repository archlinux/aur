# Maintainer: redponike <proton dot me>
# Contributor: Pravin Ramana <pravinramana25 at protonmail dot ch>

pkgname=python-tinygrad
_name=${pkgname#python-}
pkgver=0.10.2
pkgrel=1
pkgdesc="You like pytorch? You like micrograd? You love tinygrad! <3"
arch=('any')
url="https://github.com/tinygrad/tinygrad"
license=('MIT')
depends=('python>=3.10')
optdepends=('python-llvmlite: LLVM Backend Support'
            'python-unicorn: ARM Backend Support'
            'python-triton: Triton Backend Support'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('53e808fcbfe540302c20045b8a53b9fc709fdb96deb669e0fff3949327ad49a7')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
