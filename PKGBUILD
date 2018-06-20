# Submiter: AdrianoML <adriano.lols@gmail.com>

pkgname=steascree
pkgver=1.5.4.r4.g98748f9
pkgrel=1
pkgdesc="A QT screenshot \"injector\" for the steam screenshot uploader"
arch=('x86_64')
url="https://github.com/Foyl/SteaScree/"
source=('git://github.com/Foyl/SteaScree/' 'steascree.desktop')
license=('GPL3')
depends=('qt5-base')
makedepends=('git' 'cmake')
_gitname=SteaScree

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_gitname"

  qmake
  make
}

package() {
  cd "$srcdir/$_gitname"

  install -D -m755 SteaScree "$pkgdir/usr/bin/SteaScree"
  install -D -m644 "./res/icons/SteaScree.svg" "${pkgdir}/usr/share/icons/SteaScree.svg"
  install -D -m644 "${srcdir}/steascree.desktop" "${pkgdir}/usr/share/applications/steascree.desktop"
}

md5sums=('SKIP'
         'bc829e89369a4a1cf612be979f55b272')
