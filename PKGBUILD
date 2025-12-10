# Contributor: felinae225 <felinae225@qq.com>
pkgname=python-you-live
pkgdesc="A live recorder focus on China mainland livestream sites."
pkgver=1.1.5
pkgrel=2
arch=('any')
url='https://github.com/nICEnnnnnnnLee/LiveRecorder'
depends=('python' 'python-requests' 'python-pyexecjs')
makedepends=('python-setuptools')
license=(MIT)
md5sums=(SKIP)
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

build() {
    cd "$_name-$pkgver"
    python -m setuptools.launch setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
