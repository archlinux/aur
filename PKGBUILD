# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=AutoLinux
pkgname=auto
pkgver=2.0.2
pkgrel=1
pkgdesc='ArchLinux bootstrap scripts, with optional riced configs for the AutoLinux platform'
arch=(x86_64)
url="https://gitlab.com/qYp/${_pkgname}"
license=('MIT')
depends=(dialog)
makedepends=(git)                 
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('5d33502a6e6a24108708f901748654b74eef33e81bd1434139b0a9c02c7e8a46')

pkgver() {
  printf "2.0.$(git rev-list --count HEAD)"
}

package() {
  cd "$srcdir"
    install -Dm755 ${pkgname}/{AutoLinux.sh,pre-install.sh} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 ${pkgname}/AutoLinux.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 ${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
