# Maintainer: dbgbgtf <dudududumaxver@outlook.com>
# Maintainer: RocketDev <ma2014119@outlook.com>
pkgname=ceccomp
_reponame=Ceccomp
pkgver=1.3
pkgrel=2
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

sha256sums=('5de4758236227089335b2bae2c405de4196c860c18b438decce25b09579a4e2c')
b2sums=('630cbb5de06645368c227803c264b0c91b16198879475e60d7274037380adf33a4b59ba65cab325b6599db6a2f9d5cbec6619ba402e620b18560e9029bbf6fb4')

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
