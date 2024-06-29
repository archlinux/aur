# Maintainer: Donald Webster <fryfrog@gmail.com
# Contributor: Andrew Rabert <arabert at nullsum dot net>

pkgname='python-enzyme'
_name=${pkgname#python-}
pkgver=0.5.2
pkgrel=1
pkgdesc="Python module to parse metadata in video files."
arch=(any)
url="https://github.com/Diaoul/enzyme"
license=('Apache')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
conflicts=(${pkgname}-git)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f85d5ee536f2a60d401bc57640b6c989ec94b325dcc6b2a70c27deab2b7336b0fd6cdd3d93790128d6fb3fa72a783dd7814da8ca3665da19593c065af2b07131')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
