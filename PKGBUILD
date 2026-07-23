# Maintainer: Knotrocket <knotrocket12 at gmail dot com>

pkgname=arf-helper
pkgver=0.2.1
pkgrel=1
pkgdesc="An fzf Pacman wrapper and AUR helper"
url="https://github.com/Samq64/arf"
arch=('any')
license=('MIT')
depends=('fzf' 'git' 'pacman' 'pyalpm' 'python' 'python-srcinfo')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('sudo: default privilege elevation')
conflicts=('arf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Samq64/arf/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('79eb57ae2a770b8cc55dcaacb665a863fe1842b0755d113a2686f29acaf3d33e')

build() {
    cd "arf-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "arf-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
