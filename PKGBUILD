# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-todoist-api-python
_name=${pkgname#python-}
__name=${_name//-/_}
pkgver=1.1.0
pkgrel=3
pkgdesc="This is the official Python API client for the Todoist REST API."
arch=(any)
url="https://github.com/Doist/$_name"
license=('MIT')
groups=()
depends=(python-requests)
makedepends=(python-build python-installer)
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${__name::1}/$__name/$__name-$pkgver.tar.gz")
sha256sums=('cee8c8993e889635a9ad5947e40d0f5969f4fefc3787fd7be6f32e42561a2244')

build() {
    cd "$srcdir/$__name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$__name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

