# Maintainer: Adrien Smith <adrien at panissupraomnia dot dev>
# Contributor: jason ryan <jasonwryan@gmail.com>
# Contributor: megadriver <megadriver at gmx dot com>
# Contributor: Vasil Yonkov <bustervill at gmail dot com>
# Contributor: Guten Ye <ywzhaifei [at] gmail [dot] com>

pkgname=ruby-build-git
pkgver=20231211.r0.g1b66c83
pkgrel=1
pkgdesc="Compile and install Ruby"
arch=('any')
url="https://github.com/rbenv/${pkgname%-git}"
license=("MIT")
depends=('bash')
makedepends=('git')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
  cd "${pkgname%-git}"
  PREFIX="$pkgdir/usr" ./install.sh
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
