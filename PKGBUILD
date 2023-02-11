# Maintainer: Sukbeom Kim <sukbeom.kim@gmail.com>
pkgname="klicknmenu"
pkgver=0.2
pkgrel=1
pkgdesc="X11 based lightweight menu application"
arch=('any')
url="https://github.com/seokbeomKim/klicknmenu"
license=('GPL')
depends=('libx11')
source=("${pkgname}::git+${url}")
md5sums=('SKIP')
provides=("${pkgname}")

build() {
    cd "${srcdir}/${pkgname}"
    make
}


package() {
    cd "${srcdir}/${pkgname}/"
    install -Dm 755 "${pkgname}" ${pkgdir}/usr/bin/${pkgname}
    install -Dm 644 .klicknmenu.example -t "${pkgdir}/usr/share/${pkgname}"
    echo "Please copy the ~/.klicknmenu.example to ~/.klicknmenu and modify the file appropriately as you want.";
}

