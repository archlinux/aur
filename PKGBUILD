pkgname=douane-dkms-git
pkgver=0.8.2+5.gdf94296dea10b3a5ce3e
pkgrel=1
pkgdesc="Douane Firewall Kernel Module (DKMS)"
arch=('x86_64')
url="http://douaneapp.com/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
source=('git+https://gitlab.com/douaneapp/douane-dkms.git')
md5sums=('SKIP')
conflicts=(douane-dkms)
provides=(douane-dkms=${pkgver%+*})

pkgver() {
  git -C douane-dkms describe --always | sed 's/^v//; s/-/+/; s/-/./'
}

package() {
  install -Dm644 -t "$pkgdir/usr/src/$pkgname-$pkgver/" \
    douane-dkms/dkms.conf \
    douane-dkms/Makefile \
    douane-dkms/*.c \
    douane-dkms/*.h
}
