# Maintainer: kharovtobi <tugboat_khatov at outlook dot com>
# Based on the PKGBUILD for 86Box-roms-git from AUR
# Contributor: Lili1228 <aur at lili dot lgbt>

pkgname=86box-assets-git
pkgver=5.3.r0.gbd37a20
pkgrel=1
pkgdesc='Assets for the 86Box emulator'
arch=('any')
url='https://github.com/86Box/assets'
license=('custom')
makedepends=('git')
options=('!strip')
provides=('86box-assets')
conflicts=('86box-assets')
source=("${pkgname}::git+https://github.com/86Box/assets.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "$pkgdir/usr/share/86Box/assets"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/assets"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
