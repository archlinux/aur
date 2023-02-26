# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-pypdf3
_name=PyPDF3
pkgver=1.0.6
pkgrel=4
pkgdesc="Pure-Python PDF library for splitting, merging, cropping, and transforming PDF pages."
arch=('any')
url="https://github.com/sfneal/PyPDF3"
license=('custom')
depends=('python-tqdm')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c946f3273419e37258e35e72273f49904ab15723d87a761c1115ef99799f8c5f')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
