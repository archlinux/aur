author=Baitinq
pkgname=smart-greyscale-git
_gitname=smart-greyscale
pkgver=0.r3.0425055
pkgrel=1
pkgdesc='Simple script to enable greyscale when its nighttime.'
url='https://github.com/Baitinq/smart-greyscale.git'
arch=('any')
license=('GPL')
depends=('redshift' 'picom')
makedepends=('git')
provides=('smart-greyscale')

source=("git://github.com/$author/$_gitname.git")

md5sums=('SKIP')
sha1sums=('SKIP')
sha256sums=('SKIP')

pkgver() {
    cd "$_gitname"
    printf '0.r%s.%s' \
        "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"

  # Install the program.
  mkdir -p "$pkgdir/usr/share/$_gitname"
  install -Dm755 smart-greyscale "${pkgdir}/usr/bin/$_gitname"
  chmod +x "$pkgdir/usr/bin/$_gitname"
  cp -a --no-preserve=ownership * "$pkgdir/usr/share/$_gitname"
  chmod -R 777 "$pkgdir/usr/share/$_gitname"

}
