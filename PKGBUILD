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

sha256sums=('cddf4b85e2b2da6800bfb7629eda6a89a85de46f7bdd90313931e94d430db8f8')
b2sums=('90d2470f88eda7395c529f646b818193190af819148197e7cb7416a63d0390f928ceafc9d9cfb6beabdff9752648a3c95f7bd1be5d93db4a264c353acc9719f7')

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
