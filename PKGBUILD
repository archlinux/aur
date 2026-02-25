# Maintainer: shinka <shinnkka1@gmail.com>
pkgname=sddm-theme-noctalia-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r24.05d3761
pkgrel=1
pkgdesc="a theme designed to complement the Noctalia Shell experience."
arch=('any')
url="https://github.com/mda-dev/noctalia-sddm-theme"
license=('MIT')
depends=('mpvpaper' 'hyprland' 'glibc' 'cjson')
makedepends=('git' 'sddm' 'qt5-declarative' 'qt5-quickcontrols2' 'qt5-graphicaleffects') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/noctalia-sddm-theme"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/share/sddm/themes/noctalia"
  cp -r "$srcdir/noctalia-sddm-theme/"* \
    "$pkgdir/usr/share/sddm/themes/noctalia/"
  install -Dm644 "$srcdir/noctalia-sddm-theme/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
