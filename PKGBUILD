# Maintainer: Matt Quintanilla <matt at matt quintanilla . xyz>
# Contributor: Ari Mizrahi <codemunchies at debugsecurity dot com>
# Contributor: ArchAssault Project <https://www.archassault.org>

pkgname=websploit
pkgver=4.0.4
pkgrel=1
pkgdesc="An open source project for, social engineering works, scanning, crawling and analysis, automatic exploiter, and network attacks"
arch=('any')
url='https://github.com/f4rih/websploit'
license=('Unknown')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/f4rih/websploit/archive/${pkgver}.tar.gz")
depends=('python' 'scapy' 'python-wheel' 'python-build' 'python-installer' 'python-setuptools')
md5sums=('cb3aa7333c99d4498658e63708f41d76')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
