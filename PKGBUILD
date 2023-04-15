# Maintainer: Lili1228 <aur at gramywpsl dot pl>
pkgname=86box-roms-git
pkgver=v3.11.r28.g3317d84
pkgrel=1
pkgdesc='ROMs for the 86Box emulator'
arch=('any')
url='https://github.com/86Box/roms'
license=('custom')
makedepends=('git')
options=('!strip')
provides=('86box-roms')
conflicts=('86box-roms')
source=("${pkgname}::git+https://github.com/86Box/roms.git")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}"
    install -d "$pkgdir/usr/share/86Box/roms"
    cp -R [a-z]* "$pkgdir/usr/share/86Box/roms"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
