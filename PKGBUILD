# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>

pkgname=bfetch
pkgver=2021.07.03
pkgrel=1
pkgdesc="A CLI system information tool written in BASH that supports displaying images."
arch=('any')
groups=('therepoclub')
url="https://github.com/The-Repo-Club/$pkgname"
license=('MIT')
depends=('bash')
makedepends=('git')
optdepends=(
  'catimg: Display Images'
  'chafa: Image to text support'
  'feh: Wallpaper Display'
  'imagemagick: Image cropping / Thumbnail creation / Take a screenshot'
  'jp2a: Display Images'
  'libcaca: Display Images'
  'nitrogen: Wallpaper Display'
  'w3m: Display Images'
  'xorg-xdpyinfo: Resolution detection [Single Monitor]'
  'xorg-xprop: Desktop Environment and Window Manager'
  'xorg-xrandr: Resolution detection [Multi Monitor + Refresh rates]'
)
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('bbb6d5fcf5588e8bc56a6ea351d3a2efe5fde17844d78c90b4aa0bd9ef1cbd74')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"
}
