# Maintainer: Nikita Sivakov <cryptomaniac.512@gmail.com>
# Contributor: Nikita Sivakov <cryptomaniac.512@gmail.com>

pkgname=numix-themes-archblue-git
pkgver=2.5.1
pkgrel=1
pkgdesc='A flat and light theme with a modern look using Arch Linux colors (GNOME, Openbox, Unity, Xfce)'
arch=('any')
url='http://numixproject.org/'
license=('GPL3')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('numix-themes-archblue')
conflicts=('numix-themes-archblue')
source=("numix-themes-${pkgver}.tar.gz::https://github.com/shimmerproject/Numix/archive/v${pkgver}.tar.gz")
md5sums=('4468cb3f2fe0d01e823df7c310778787')

prepare() {
    cd Numix-${pkgver}

    for FILE in `find -type f`
    do
        sed -i 's/#fc6f5d/#1793d1/g' "${FILE}"
        sed -i 's/#d64937/#1793d1/g' "${FILE}"
        sed -i 's/#2d2d2d/#333333/g' "${FILE}"
        sed -i 's/#dedede/#eeeeee/g' "${FILE}"
        sed -i 's/#d9d9d9/#dedede/g' "${FILE}"
        sed -i 's/#f0f0f0/#ffffff/g' "${FILE}"
        sed -i 's/#f9f9f9/#ffffff/g' "${FILE}"
        sed -i 's/#bdbdbd/#cbcbcb/g' "${FILE}"
        sed -i 's/Numix/Numix-ArchBlue/' "${FILE}"
    done
}

package() {
  cd Numix-${pkgver}

  install -dm 755 "${pkgdir}"/usr/share/themes/Numix-ArchBlue
  rm -rf .git .gitignore CREDITS LICENSE README.md
  cp -dr --no-preserve='ownership' * "${pkgdir}"/usr/share/themes/Numix-ArchBlue/
}

# vim: ts=2 sw=2 et:
