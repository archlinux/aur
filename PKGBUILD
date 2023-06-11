# Maintainer: Takase <takase1121@proton.me>

pkgname=dummy-pm
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple power manager for wlroots-based compositors."
arch=('any')
url="https://github.com/takase1121/dummy-pm"
license=('MIT')
depends=('util-linux' 'bash>=4.0.0' 'swayidle>=1.3.0')
optdepends=('brightnessctl: display brightness support'
            'wlopm: wlroots DPMS support'
            'swaylock: lock screen support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/takase1121/dummy-pm/archive/v${pkgver}.tar.gz")
sha256sums=('05df50a657ca8009ffcf5bc66be07d82a9242da17d737c3afddc3cc8ce90c0a4')

package() {
  cd "${pkgname}-${pkgver}"

  # install itself
  install -Dm755 dummy-pm "$pkgdir/usr/bin/dummy-pm"

  # default config
  install -Dm644 dummy-pm-config "$pkgdir/usr/share/$pkgname/dummy-pm-config"

  # license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
