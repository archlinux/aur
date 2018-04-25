# Maintainer: Oliver Anhuth <oliver.anhuth at zoho.com>

pkgname=winctl
pkgver=0.7
pkgrel=1
pkgdesc="Window layout scripting utility (like devilspie2) which uses relative positions (percentages)"
arch=("i686" "x86_64")
url="https://github.com/oliver-anhuth/winctl"
license=("MIT")
depends=('lua>=5.2' 'gtk3' 'libwnck3')
source=("https://github.com/oliver-anhuth/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=("8923f0ff7e01108c6f020cb50e7e126c3556bd9a96297960a2948f5c374e8119")

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    mkdir -p "$pkgdir/usr/bin"
    cp ${srcdir}/${pkgname}-${pkgver}/${pkgname} "${pkgdir}/usr/bin/"
}
