# Maintainer: Dacraezy1 <younesaouzal18@gmail.com>

pkgname=arch-news-guard
_pkgname=arch-news-guard
pkgver=1.0.1
pkgrel=1
pkgdesc="A CLI tool that checks for risky Arch Linux news before running a system update."
arch=('any')
url="https://github.com/Dacraezy1/arch-news-guard"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-rich')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Dacraezy1/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('a341bc64287a1979dd13dd65cac5be0548f55dafe4ceb9c2b1e7b2cc4ff51685')

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
