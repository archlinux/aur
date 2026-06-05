# Maintainer: Knotrocket <knotrocket12 at gmail dot com>

pkgname=arf-helper
pkgver=0.2.0
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
sha256sums=('b15b367ac632bd5c8bc3c35e9c6f9dda29de2013bad68aa20de82f6ff99f93e9')

build() {
    cd "arf-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "arf-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
