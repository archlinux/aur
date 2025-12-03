# Maintainer: Dacraezy1 <younesaouzal18@gmail.com>

pkgname=arch-news-guard
_pkgname=arch-news-guard
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI tool that checks for risky Arch Linux news before running a system update."
arch=('any')
url="https://github.com/Dacraezy1/arch-news-guard"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-rich')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dacraezy1/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('634a473fe5549fc56b57931081ce434a1cb8a753ddc9edc6eab8b5263e2e287f')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
