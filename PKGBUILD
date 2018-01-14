# Maintainer:

pkgname=f1spirit
pkgver=0.rc9.1615
pkgrel=5
pkgdesc="Classic MSX race game remade by Brain Games"
arch=('i686' 'x86_64')
license=('unknown')
url="http://www.braingames.getput.com/f1spirit"
depends=('sdl_image' 'sdl_mixer' 'sdl_net' 'glu' 'curl')
source=("http://braingames.jorito.net/f1spirit/f1spirit.src_0.rc9-1615.tgz"
        "f1spirit.patch")
sha256sums=('fc1778dcec68ccd31b9da893abee67e64a7931a34c75a63f8563355b810acbd7'
            '2859d16ab7bcb9c033d80436abd067928dec712865b6dd7beb47bc7da242ca81')

prepare() {
  cd $pkgname-$pkgver
  # fix compile errors, bin path, flags
  patch -p1 -i ../f1spirit.patch
}

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make PREFIX="$pkgdir"/usr install
}
