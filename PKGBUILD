# Maintainer: tarneo <tarneo@tarneo.fr>
pkgname='python-autoslot'
pkgver=2022.12.1
pkgrel=1
pkgdesc='Automatic __slots__ for your Python classes'
arch=('any')
url='https://github.com/cjrh/autoslot'
license=('Apache')
groups=()
depends=('python-flit')
makedepends=(python-build python-installer python-wheel python-pytest)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()
sha256sums=('576593ab8acf471e22b370bfb70bf94e4f4efef53ff0b720ffc0cabcc464d7a0')

_name='autoslot'
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
