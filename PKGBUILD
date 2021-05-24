# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=jar-thumbnailer-git
pkgver=5.a5e6ae0
pkgrel=1
pkgdesc="J2ME jar files thumbnailer for file-managers like nautilus, nemo, etc"
arch=(any)
url="https://github.com/realmazharhussain/jar-thumbnailer"
license=('GPL v3')
depends=('bash' 'unzip' 'coreutils' 'sed')
makedepends=()
provides=('jar-thumbnailer')
conflicts=('jar-thumbnailer')
source=("$pkgname"::'git+https://github.com/realmazharhussain/jar-thumbnailer.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "${pkgname}"
    DESTDIR="$pkgdir" PREFIX=/usr ./install.sh
}
