# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.5.1
pkgrel=1
pkgdesc="EncFS gui and cli front-end"
arch=("any")
url="https://projects.deparis.io/projects/carp"
license=("WTFPL")
depends=("python-xdg" "python-gobject" "encfs")
optdepends=("openssh: sync support"
            "rsync: sync support")
makedepends=("python-setuptools")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('23f72257722a5043a3d1501c4435042849e33ea7abd75fe0de15dd1968bee9cc')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DEST="$pkgdir/usr" PYDEST="$pkgdir/" install
}
