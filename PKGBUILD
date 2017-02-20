# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.5.3
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
sha256sums=('2928b5329cd170ed56926a049827a0eaeb852a5cbb28d9d55738bd0b895e1d2e')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DEST="$pkgdir/usr" PYDEST="$pkgdir/" install
}
