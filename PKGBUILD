# Maintainer: Mark <levmarkpost@gmail.com>
pkgname=python-webos-ctl
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool to control LG webOS TVs"
arch=('any')
url="https://github.com/$(git remote get-url origin | sed 's|.*github.com/||' | sed 's|\.git||')"
license=('MIT')
depends=('python>=3.12' 'python-pyfiglet' 'python-pywebostv' 'python-scapy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$(git remote get-url origin | sed 's|.*github.com/||' | sed 's|\.git||')/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    python -m build
}

package() {
    cd "$pkgname-$pkgver"
    pip install --root="$pkgdir" --ignore-installed .
}