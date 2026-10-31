# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=freelance-invoice-cli
pkgver=1.0.0+r31.07e93ff
pkgrel=1
_repo=freelance-invoice-cli
_commit=07e93ffc4243f284a43d2121252f2b586f007503
_srcdir="$_repo-$_commit"
pkgdesc="Generate a clean HTML invoice from a JSON file. Zero dependencies"
arch=('any')
url="https://github.com/kleogeos/freelance-invoice-cli"
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kleogeos/freelance-invoice-cli/archive/$_commit.tar.gz")
sha256sums=('5243c43784ba4a7ce01a7d29e885eb060edf964444ea3cebd2ac2b072aac18e3')

package() {
	cd "$_srcdir"
	install -Dm755 invoice.py "$pkgdir/usr/bin/freelance-invoice"
	install -Dm644 "$srcdir/$_srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
