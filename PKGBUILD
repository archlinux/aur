# Contributor: hax404 <hax404fooaurblinkenlib@hax404.de>
pkgname=blinkenlib
pkgver=0.8.1
pkgrel=1
pkgdesc="C library to mess with LED projects and Blinken-houses"
arch=('i686' 'x86_64')
url="http://wiki.blinkenarea.org/index.php/BlinkenLibEnglish"
license=('GPL-3.0-only')
#depends=('giflib')
makedepends=('git')
source=("git+https://git.blinkenarea.org/BlinkenLib.git#tag=v${pkgver}")
sha256sums=(SKIP) #autofill using updpkgsums

build() {
  cd "BlinkenLib"
  git cherry-pick -n 81c56c20d63d3e23bce441821699f33e924fdf41
  git cherry-pick -n 91187564724529eb9309152652fca160408c5385
  git cherry-pick -n d1d5aa97b4344618e9f1b7207b0b21c6259f5074
  make -j1
}

package() {
  cd "BlinkenLib"

  make DEF_PREFIX="$pkgdir/usr" install
}

