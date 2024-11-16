# Maintainer: T. Witt
pkgname=plasma6-applets-analog24hclock
pkgver=r6.c6c5eb5
pkgrel=1
pkgdesc="Analog 24h clock"
arch=('any')
url="https://github.com/sleepywitti/analog24hclock-plasmoid/"
license=('GPL3')
depends=('plasma-workspace' 'plasma5support')
makedepends=('git')
conflicts=(plasma5-applets-analog24hclock)
source=("${pkgname}::git+https://github.com/sleepywitti/analog24hclock-plasmoid.git#commit=c6c5eb50ce5108ba34a4bb936f81eff416c1e6d3")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  mkdir -p "$pkgdir"/usr/share/plasma/plasmoids/org.twitt.analog24hclock/
  cp -r --no-preserve=ownership package/* "$pkgdir"/usr/share/plasma/plasmoids/org.twitt.analog24hclock/
}
# vim:set ts=2 sw=2 et:
