pkgname=pick-colour-picker
pkgver=1.5.0
pkgrel=1
pkgdesc="Pick. A colour picker that remembers where you picked colours from"
arch=('any')
url="http://kryogenix.org/code/pick/"
license=('custom')
source=("${pkgname}_-${pkgver}201606011144-ubuntu16.10.1_all.deb::http://kryogenix.org/code/pick/ppadl.php?ppa=pick&owner=sil&pkg=${pkgname}")
md5sums=('2ab08872bc92586298dfd08141057bc8')

prepare() {
    bsdtar -xJf data.tar.xz
}

package() {
    cp --preserve=mode -r {opt,usr} "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +

    install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
    mv ${pkgdir}/opt/pick-colour-picker/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}
}



