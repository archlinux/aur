
pkgname=python-odfdo
_name=odfdo
pkgver=3.13.2
pkgrel=1
pkgdesc="Python3 library implementing the ISO/IEC 26300 OpenDocument Format standard."
arch=('any')
url="https://github.com/jdum/odfdo"
license=('custom')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('4b5aa9ddf76c18edeb883d6f79524f4a6939bfd609c8194e231015f6e8779cf5')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

