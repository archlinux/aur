# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbff-git
pkgver=0.70.57b59a0
pkgrel=1
epoch=1
pkgdesc="A small ffmpeg-based framebuffer media player."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/fbff.git"
license=('GPL')
depends=('ffmpeg')
optdepends=('libmpeg3: alternative media backend'
            'oss: sound support')
makedepends=('git')
provides=('fbff')
conflicts=('fbff')
install=$pkgname.install
source=("$pkgname::git+git://repo.or.cz/fbff.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build(){
  cd "$srcdir/$pkgname"
  make
}

package(){
  cd "$srcdir/$pkgname"
  install -Dm755 fbff "$pkgdir/usr/bin/fbff"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

