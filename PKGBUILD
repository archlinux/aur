# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>
# Contributors: Jesús Castro <x51v4n@gmail.com>, @killajoe, @Snowmobil, @ThomasWeiser (GitHub)
pkgname=i3-cinnamon-git
_pkgname=i3-cinnamon
pkgver=5.0
pkgrel=1
epoch=1
pkgdesc="Starts i3 inside a cinnamon session."
arch=('any')
url="https://github.com/jthomaschewski/i3-cinnamon/"
license=('MIT')
depends=('i3-wm' 'cinnamon>=5.0.0' 'cinnamon-session' 'cinnamon-settings-daemon')
provides=('i3-cinnamon')
optdepends=('gdm: Recommended display manager')
source=('git+https://github.com/jthomaschewski/i3-cinnamon')
sha256sums=('SKIP')

build() {
  cd "$_pkgname"

  make
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir/" install
}
