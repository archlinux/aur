# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
_reponame=Ceccomp
pkgver=1.2
pkgrel=1
pkgdesc="A C-based seccomp analysis tool"
arch=(x86_64)
url="https://github.com/dbgbgtf1/Ceccomp"
license=('GPL-3.0-or-later')
depends=(libseccomp)
makedepends=(
  gcc
  libseccomp
  make
  git
)
source=(git+https://github.com/dbgbgtf1/Ceccomp.git#tag=v${pkgver}?signed)

sha256sums=('7dcad47ff8e0ba21c197f03674986f15a43001b78da3129aef6843520e0b1275')
b2sums=('a942084190822cce96016bf84c8e4704d612b213d8d3bdd2ac71b5b535abac99aebc6e52f47ecd8ff9da6fe63159c1710660d1c2337681396b59326cac2a690d')

validpgpkeys=(
  '0816A179BB09248F30468BD6542A0969B5CEDCDB' # dbgbgtf1 <dudududumaxver@outlook.com>
)

prepare() {
  mv "$_reponame" "$pkgname"
}

build() {
	cd "$pkgname"
	make ceccomp DEBUG=1 -j
}

package() {
	cd "$pkgname"
  make install DEST_DIR="$pkgdir"
}
