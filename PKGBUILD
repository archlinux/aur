# Maintainer: Katelyn Hamer <kathamerr@gmail.com>

pkgname=katfetch-git
pkgver=1.3.1
pkgrel=3
pkgdesc="A minimal and customizable fetch script."
arch=(any)
url="https://gitlab.com/KatHamer/katfetch"
license=(MIT)
depends=(
python-setuptools
wmctrl
) 

_commit="3b5548e48cc645f38bd9fcba746ffa3da9069267"
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/KatHamer/katfetch/-/archive/$_commit/katfetch-$_commit.tar.gz")

sha256sums=('508182c6fbea905558f3cb7e7b6cf6c3a5afc8ae725fbfd0f0f91d23e2c013b0')

package() {
cd katfetch-$_commit
python3 setup.py install --root="$pkgdir/"
install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

