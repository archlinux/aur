pkgname=pick-colour-picker
pkgver=1.5
pkgrel=1
pkgdesc="Pick. A colour picker that remembers where you picked colours from"
arch=('any')
url="http://kryogenix.org/code/pick/"
license=('custom')
source=("${pkgname}_${pkgver}-0-201606011144-ubuntu16.10.1_all.deb::https://code.launchpad.net/~sil/+archive/ubuntu/pick/+files/${pkgname}_${pkgver}-0~201606011144~ubuntu16.10.1_all.deb")
md5sums=('2ab08872bc92586298dfd08141057bc8')

prepare() {
    bsdtar -xJf data.tar.xz
}

package() {
    cp --preserve=mode -r /usr/bin "${pkgdir}"

    find "${pkgdir}" -type d -exec chmod 755 {} +

    install -dm755 "${pkgdir}"/usr/share/licenses/$pkgname
    mv "{$pkgdir}"/usr/share/licenses/$pkgname
}



