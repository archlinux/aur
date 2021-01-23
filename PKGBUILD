# Maintainer: lmartinez-mirror
pkgname=fish-pisces
pkgver=0.7.0
pkgrel=1
pkgdesc="Fish plugin for matching paired symbols"
arch=('any')
url="https://github.com/laughedelic/pisces"
license=('LGPL3')
groups=('fish-plugins')
depends=('fish>=2.3')
provides=('fish-pisces')
conflicts=('fish-pisces')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('c29cbdfdb6c9586b01c6a4ce19d57cec5f620152d86a66f7bda12689b90df834917a612fa792ea8e94821194b78b3e5a65331e710ae006adf1994f10415b951a')

package() {
  cd "pisces-$pkgver"
  install -Dm644 conf.d/pisces.fish -t "$pkgdir/etc/fish/conf.d/"
  find functions -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/fish/{}" \;
}

