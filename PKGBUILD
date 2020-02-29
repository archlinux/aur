pkgname=awesome-quicklaunch-git
pkgver=2020.02.22.g2156e42
pkgrel=1
pkgdesc='Quicklauncher widget for awesome WM'

arch=('any')
url='https://github.com/deficient/quicklaunch'
license=('Public Domain')
depends=('awesome')
makedepends=('git')
source=('git+https://github.com/deficient/quicklaunch.git')
md5sums=('SKIP')
_gitname='quicklaunch'



pkgver() {
  cd "${srcdir}/${_gitname}"
      git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd $srcdir/${_gitname}
}

package() {
  cd ${srcdir}/${_gitname}
  # Install the library
  install -Dm644 init.lua "$pkgdir/usr/share/awesome/lib/quicklaunch/init.lua"
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 UNLICENSE "$pkgdir/usr/share/doc/$pkgname/UNLICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
