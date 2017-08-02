# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.6.1
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
sha256sums=('5564610f4c4158cc1ba63d6b2413d9d6a2a259112eed9ecb83ba711c89902399')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DEST="$pkgdir/usr" PYDEST="$pkgdir/" install
}
