# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
_reponame=Ceccomp
pkgver=1.3
pkgrel=3
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

sha256sums=('e3748820b1cb1af4c3d6ab1591d9660dd1de22a871adece6480fdf9ae7d0489e')
b2sums=('b5e9f1dd45a8eb54b5518bc4874460fd9bb93c4a23e211afb30cda0a9933ca5951edc545e303e9612e9280f7c293fe4f4ac3e76cce1144f39c309a87c926cd6e')

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
