pkgname=nsdiff
pkgver=1.79
pkgrel=1
pkgdesc="Create an 'nsupdate' script from DNS zone file differences"
url="https://dotat.at/prog/nsdiff/"
license=(CC0-1.0)
arch=(any)
depends=(
  bind          # named-compilezone
  bind-tools    # dig, nsupdate
  perl
)
provides=(
  nspatch=$pkgver
  nsvi=$pkgver
)
source=("https://dotat.at/prog/nsdiff/nsdiff-$pkgver.tar.gz")
#source=("git+https://github.com/fanf2/nsdiff.git")
#source=("git+https://git.uis.cam.ac.uk/x/uis/ipreg/nsdiff.git")
sha256sums=('ae0ceb0989953080fe713d73bc42a23582a9ad804e2b6cd73d6097ec84420f9e')

package() {
  cd nsdiff-$pkgver
  make prefix="$pkgdir/usr" install
}

# vim: ts=2:sw=2:et
