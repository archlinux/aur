# Maintainer: bretello <bretello@distruzione.org>
pkgname=bretellofier
pkgver=0.4.2
pkgrel=1
pkgdesc="Command line telegram notifier"
arch=(any)
url="https://git.decapod.one/brethil/bretellofier"
license=('dowhateverthefuckyouwant')
depends=(python)
makedepends=(python-wheel python-installer)
source=("git+https://git.decapod.one/brethil/bretellofier")
sha256sums=(SKIP)

pkgver() {
    cd "$pkgname"
    python -m setup --version
}

build() {
    cd "$pkgname"
    python -m setup bdist_wheel
}

package() {
    cd "$pkgname"
    echo "pkgname=$pkgname"
    echo "pwd=$PWD"
    python -m installer --destdir "$pkgdir" dist/*whl
}
