# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.6.0
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
sha256sums=('8e02109cf44b519f67939737f19f04ff9043c06bee959bd10595811f3df11c18')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DEST="$pkgdir/usr" PYDEST="$pkgdir/" install
}
