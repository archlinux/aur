# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.7.1
pkgrel=1
pkgdesc="EncFS gui and cli front-end"
arch=("any")
url="https://projects.deparis.io/projects/carp"
license=("WTFPL")
depends=("encfs" "python-gobject" "python-inotify" "python-xdg")
optdepends=("rsync: sync support")
makedepends=("python-setuptools" "emacs")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a3484cbf2e6f1de7415203e3c49af445514fb2ef7fa9e5ce001004a590b1ed1c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DEST="$pkgdir/usr" PYDEST="$pkgdir/" install
}
