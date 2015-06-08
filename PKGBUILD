# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Diego <cdprincipe@gmail.com>

pkgname=numix-themes-git
pkgver=2.5.1.r11.c05a9fd
pkgrel=1
pkgdesc='A flat and light theme with a modern look (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('numix-themes')
conflicts=('numix-themes')
source=('numix-themes::git+https://github.com/shimmerproject/Numix.git')
md5sums=('SKIP')

pkgver() {
  cd numix-themes

  printf "%s" "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
  #printf "2.5.1.r%s.%s" "$(git rev-list --count v2.4..HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd numix-themes

  install -dm 755 "${pkgdir}"/usr/share/themes/Numix
  rm -rf .git .gitignore CREDITS LICENSE README.md
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Numix/
}

# vim: ts=2 sw=2 et:
