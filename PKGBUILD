# Maintainer: bretello <bretello@distruzione.org>
pkgname=bretellofier
pkgver=0.4.2
pkgrel=3
pkgdesc="Command line telegram notifier"
arch=(any)
url="https://git.decapod.one/brethil/bretellofier"
license=('dowhateverthefuckyouwant')
depends=(python)
makedepends=(python-build python-setuptools-scm)
source=("git+https://git.decapod.one/brethil/bretellofier")
sha256sums=(SKIP)

pkgver() {
    cd "$pkgname"
    python -m setuptools_scm
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    pip install dist/*whl
}
