# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Victor Bayas <victorsbayas at gmail dot com>

pkgname=envycontrol
pkgver=3.5.2
pkgrel=2
pkgdesc="CLI tool for Nvidia Optimus graphics mode switching on Linux"
arch=('any')
url="https://github.com/bayasdev/envycontrol"
license=('MIT')
depends=('python' 'xorg-xrandr')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'git')
conflicts=('optimus-manager')
source=("$pkgname::git+$url#tag=v$pkgver")
sha256sums=('82cfa1b8b462d35ee7900610069267c4a9bbb582574336f831366e02b263c500')

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
