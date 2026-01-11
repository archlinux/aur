# Maintainer: baseplate-admin <61817579+baseplate-admin@users.noreply.github.com>
pkgname=modern-colorthief
_name=modern_colorthief
pkgver=0.1.12
pkgrel=1
pkgdesc="A modern color thief"
arch=('x86_64')
url="https://github.com/baseplate-admin/modern_colorthief"
license=('MIT')
depends=('python')
makedepends=('python-installer')
conflicts=("$_name-git")
source=("https://github.com/baseplate-admin/modern_colorthief/releases/download/0.1.12/modern_colorthief-0.1.11-cp314-cp314-manylinux_2_17_x86_64.manylinux2014_x86_64.whl" "https://github.com/baseplate-admin/modern_colorthief/releases/download/0.1.12/modern_colorthief-0.1.11-cp314-cp314-manylinux_2_17_s390x.manylinux2014_s390x.whl" "https://github.com/baseplate-admin/modern_colorthief/releases/download/0.1.12/modern_colorthief-0.1.11-cp314-cp314-manylinux_2_17_ppc64le.manylinux2014_ppc64le.whl")
sha256sums=('f903a1296d1e36b29843bd4e680b8663129217032e0ed1ced33a2533cb805963' 'fb4cdbf03fafec5ea91be266a8ed98d7f5c46800a89b75104614745ad0c65d14' '1bd67de6e160b61e1a04465e56e22c92ac2a167469162d914bb1aa6a5c0e95f5')

package() {
    _pyver="cp$(python -c 'import sys; print(f"{sys.version_info.major}{sys.version_info.minor}")')"
    python -m installer --destdir="$pkgdir" *"${_pyver}"*.whl
}
