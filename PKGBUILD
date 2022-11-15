# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-todoist-api-python
_name=${pkgname#python-}
__name=${_name//-/_}
pkgver=2.0.2
pkgrel=1
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
sha256sums=('ec8567649e35c244a44608b5e0c125aabf9e567c0f2df55959af39024a856e25')

build() {
    cd "$srcdir/$__name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$__name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

