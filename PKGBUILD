pkgname=pdf-decrypt
_gitname=pdf-decrypt
pkgver=0
pkgrel=1
pkgdesc="Remove password-protection from PDFs permanently."
arch=('any')
url="https://github.com/zvyn/pdf-decrypt"
license=('MIT')
depends=('qpdf')
makedepends=('git')
source=('git://github.com/zvyn/pdf-decrypt.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  ## Use the tag of the last commit
  # git describe --always | sed 's|-|.|g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  install -Dm755 "$srcdir/$_gitname/$pkgname.bash" "$pkgdir/usr/bin/$pkgname"
  install -Dm755 "$srcdir/$_gitname/$pkgname.png"\
      "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm755 "$srcdir/$_gitname/$pkgname.desktop"\
      "$pkgdir/usr/share/applications/$pkgname.desktop"

}
