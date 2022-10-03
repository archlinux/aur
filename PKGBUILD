pkgname=art-git
pkgver=1.0.0
pkgrel=1
pkgdesc="My post arch configuration script"
arch=(x86_64 i686)
url="https://github.com/kavulox/Art.git"
license=('MIT')
makedepends=(git)
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    printf "1.0.0" 
}

package() { 
    cd "${pkgname}"
    mkdir -p ${pkgdir}/opt/${pkgname}
    cp -rf * ${pkgdir}/opt/${pkgname}
    install -Dm777 art.sh "${pkgdir}/usr/bin/art"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
