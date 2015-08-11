# Maintainer: Brian Tomlinson <darthlukan@gmail.com>
pkgname=openbox-theme-silence-arch-git
pkgver=1.0.afba0d
pkgrel=1
pkgdesc='A dark Openbox 3 theme'
arch=('any')
url='https://github.com/darthlukan/silence-arch'
license=('GPL2')

depends=('openbox')
makedepends=('git')
optdepends=()
provides=("${pkgname}-${pkgver}")
conflicts=("${pkgname}")

source=('silence-arch::git+https://github.com/darthlukan/silence-arch.git')
md5sums=('SKIP')

pkgver() {
   cd silence-arch
   printf "1.0.%s" "$(git rev-parse --short HEAD)" 
}

package() {
    cd silence-arch
    rm -rf .git .gitignore README.md LICENSE PKGBUILD screenshot_1.png silence-arch.obt
    mkdir -p ${pkgdir}/usr/share/themes/silence-arch
    cp -R * ${pkgdir}/usr/share/themes/silence-arch
}
