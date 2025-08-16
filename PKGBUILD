# Maintainer: BigfootACA <bigfoot@classfun.cn>
_name=xstatic
__name=XStatic
pkgbase=python-$_name
pkgname=(python-$_name)
pkgver=1.0.3
pkgrel=1
pkgdesc="XStatic base package with minimal support code"
arch=(any)
url="https://github.com/xstatic-py/xstatic"
license=(MIT)
depends=('python')
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${__name:0:1}/$__name/$__name-$pkgver.tar.gz"
	"LICENSE.txt")

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    cd ..
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
