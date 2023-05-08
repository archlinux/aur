# Maintainer: Gonçalo Pereira <goncalo_pereira@outlook.pt>
pkgname=python-wrapt-timeout-decorator
_name=wrapt_timeout_decorator
pkgver=1.3.12.2
pkgrel=1
pkgdesc="Powerful Timeout Decorator that can be used safely on classes, methods, class methods"
url="https://github.com/bitranox/wrapt_timeout_decorator"
depends=(
    'python'
    'python-cli-exit-tools'
    'python-lib-detect-testenv'
    'python-multiprocess'
    'python-psutil'
    'python-wrapt'
)
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0b0f1a0d608c51f24cbcba3fd93226ae84029450328957be4245530177a610c9')

build() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$srcdir/$_name-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1
}
