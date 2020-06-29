# Maintainer: Edward Pacman <edward@edward-p.xyz>
_pkgname='consolas-with-yahei'
pkgname=ttf-consolas-with-yahei-powerline-git
pkgver=r14.b6e9163
pkgrel=1
pkgdesc="Consolas-with-Yahei with powerline patched with nerd-fonts)"
arch=(any)
url=https://github.com/crvdgc/Consolas-with-Yahei
depends=(fontconfig xorg-font-utils)
conflicts=(ttf-consolas-with-yahei)
install=$pkgname.install
source=("git+https://github.com/crvdgc/Consolas-with-Yahei.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/Consolas-with-Yahei"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  mkdir -p "$pkgdir"/usr/share/fonts/$_pkgname
  chmod -R 755 "$pkgdir"/usr/
  cp Consolas-with-Yahei/ttf/Consolas-with-Yahei\ Nerd\ Font.ttf "$pkgdir"/usr/share/fonts/$_pkgname/consnerd.ttf
  cp Consolas-with-Yahei/ttf/Consolas-with-Yahei\ Bold\ Nerd\ Font.ttf "$pkgdir"/usr/share/fonts/$_pkgname/consnerdb.ttf
  cp Consolas-with-Yahei/ttf/Consolas-with-Yahei\ Italic\ Nerd\ Font.ttf "$pkgdir"/usr/share/fonts/$_pkgname/consnerdi.ttf
  cp Consolas-with-Yahei/ttf/Consolas-with-Yahei\ Bold\ Italic\ Nerd\ Font.ttf "$pkgdir"/usr/share/fonts/$_pkgname/consnerdz.ttf
}
