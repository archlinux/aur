# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: tailinchu <use_my_id at gmail dot com>

pkgname=mimi
pkgver=0.1.0
pkgrel=1
pkgdesc="Active fork of mimi, a minimal and lightweight xdg-open drop-in replacement most suitable for Window Manager users."
url='https://github.com/BachoSeven/mimi'
arch=('any')
license=('MIT')
depends=('bash')
makedepends=('git')
optdepends=('dmenu' 'libnotify')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e3f4970e7e9060b41ee752ae87f54da06ab6bafbc257e54d64ef6f9be64d944cf9c0fbee9a6fd839e334dfe99bd4b30ab69c03b451af168a0c74066170795359')
provides=('xdg-utils')
conflicts=('xdg-utils')

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE  "${pkgdir}/usr/share/licenses/${pkgver}"
}
# vim:set ts=2 sw=2 et:
