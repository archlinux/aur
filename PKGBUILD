# Maintainer: Markus Plangg <mksplg at gmail.com>
pkgname=docker-gc-git
pkgver=r135.ff0b648
pkgrel=1
pkgdesc='A simple Docker container and image garbage collection script'
arch=('any')
url='https://github.com/spotify/docker-gc'
license=('Apache')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/spotify/docker-gc.git')
md5sums=('SKIP')

depends=('bash')
makedepends=('git')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D -m755 "${pkgname%-git}"/docker-gc "$pkgdir/usr/bin/docker-gc"
  install -d -m755 "$pkgdir"/var/lib/docker-gc
}
