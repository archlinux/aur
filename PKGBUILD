# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>
# Contributor: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=numix-themes-blue
pkgver=2.5.1
pkgrel=2
pkgdesc='A flat and light theme with a modern look and softer accents (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
source=("numix-themes-${pkgver}.tar.gz::https://github.com/shimmerproject/Numix/archive/v${pkgver}.tar.gz")
sha256sums=('64b0c34c49633879c8b0b9b685da7b927501ab6db265db15fed04705c04f935b')

prepare() {
  cd Numix-${pkgver}

  for FILE in `find -type f`
  do
    sed -i 's/#fc6f5d/#428de7/g' "${FILE}"
    sed -i 's/#d64937/#2d81e5/g' "${FILE}"
    sed -i 's/Numix/Numix-Blue/' "${FILE}"
  done
}
package() {
  cd Numix-${pkgver}

  install -dm 755 "$pkgdir"/usr/share/themes/Numix-Blue
  rm -rf .git .gitignore CREDITS LICENSE README.md
  cp -dr --no-preserve='ownership' * "$pkgdir"/usr/share/themes/Numix-Blue/
}

# vim: ts=2 sw=2 et:
