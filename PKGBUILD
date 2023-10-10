# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>

pkgver=4.4.5
pkgrel=4
pkgname='python-pycifrw'
_name='PyCifRW'
pkgdesc='CIF/STAR file support for Python'
arch=('any')
url='https://bitbucket.org/jamesrhester/pycifrw'
license=('Python-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('f1484789fc9f32b7fc9f2c0ab176992a571e4c5bf8d7794e0f1c1c0a7d1c8271133f0775d17b2bf47984d5c41d9c3f0ff70ef2df19525c0655bcabdb974c8b0e')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
