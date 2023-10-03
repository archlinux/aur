# Maintainer: HeCodes2Much <HeCodes2Much@github.com>
# Contributor: HeCodes2Much <HeCodes2Much@github.com>
# shellcheck disable=all

pkgname=shellfetch
pkgver=2023.07.29
pkgrel=1
pkgdesc="Shell System Information Fetcher"
arch=('any')
groups=('linuxrepos')
url="https://github.com/HeCodes2Much/$pkgname"
license=('MIT')
depends=('bash' 'xorg-xrandr' 'figlet' 'ncurses')
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('9b8ce1a271e588b0817ceb3c8e3c47000f1c5a659a6edd2daf99dfb097057ed4')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
