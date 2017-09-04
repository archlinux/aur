# Maintainer: Étienne Deparis <etienne@depar.is>
pkgname=carp
pkgver=0.7.0
pkgrel=1
pkgdesc="EncFS gui and cli front-end"
arch=("any")
url="https://projects.deparis.io/projects/carp"
license=("WTFPL")
depends=("encfs" "python-gobject" "python-xdg")
optdepends=("python-inotify: sync support"
            "rsync: sync support")
makedepends=("python-setuptools" "emacs")
source=("https://git.deparis.io/${pkgname}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e35339102e745fef379b8b8f88c374e309ba998a2870bb589a26d81405cb374a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DEST="$pkgdir/usr" PYDEST="$pkgdir/" install
}
