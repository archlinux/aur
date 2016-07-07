pkgname=mplayer-autocmd-git
pkgver=4.r18.3157ade
pkgrel=1
pkgdesc="Per-file options and keybindings for mpv"
arch=("any")
url="https://github.com/mineo/mplayer-autocmd"
license=('unknown')
source=('git+https://github.com/mineo/mplayer-autocmd.git')
md5sums=('SKIP')
depends=('python' 'mplayer')
makedepends=('git')

pkgver(){
  cd "${srcdir}/mplayer-autocmd"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "${srcdir}/mplayer-autocmd"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
