# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.7.2
pkgrel=1
pkgdesc="EncFS gui and cli front-end"
arch=("any")
url="https://projects.deparis.io/projects/carp"
license=("WTFPL")
depends=("encfs" "python-gobject" "python-inotify>=0.2.9" "python-xdg")
optdepends=("rsync: sync support")
makedepends=("python-setuptools" "emacs")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('44ff2439460dcbd5cf7a51346818ad5f07124310cacac75f487133c13c391085')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DEST="$pkgdir/usr" PYDEST="$pkgdir/" install
}
