# Maintainer: Will Handley <wh260@cam.ac.uk> (aur.archlinux.org/account/wjhandley)
pkgname=python-fastkde
_name=${pkgname#python-}
pkgver=1.0.16
pkgrel=3
pkgdesc="Fast kernel density estimation"
arch=(any)
url="https://bitbucket.org/lbl-cascade/fastkde"
license=()
groups=()
depends=('python-numpy' 'python-scipy' 'cython')
makedepends=('python-setuptools' 'python-numpy')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=(09ed51ae65848c4a8bc4cf607d4bb7371ac5140c0350601d0383f4f64e1ad375)
build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

