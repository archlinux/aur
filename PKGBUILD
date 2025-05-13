# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
_reponame=Ceccomp
pkgver=1.3
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

sha256sums=('e5887b2db130e9ab4c3519bb223bd2953cea5d2ed29acfb35ace512120345cb8')
b2sums=('5c8cce870a195dc2818896182251542c95150e79df58fa0d578a62ac1fb138030e6a2f26e210e22fa4ba79fc1cb7f2079f0c5d18ef99be7b24047bfb89bf6f44')

validpgpkeys=(
  '0816A179BB09248F30468BD6542A0969B5CEDCDB' # dbgbgtf1 <dudududumaxver@outlook.com>
  'A7ACCC386C15E3C554D34B3EAB08F98092A456BB' # RocketDev <ma2014119@outlook.com>
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
