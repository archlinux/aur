# Maintainer: KIRILL100-10 (Kirill Nadtochaev) <Kirillnadtocaev@gmail.com>
pkgname=temperature-converter-cli
pkgver=1.2
pkgrel=1
pkgdesc="Simple and lightweight CLI temperature converter with EN/RU/FR/GR localization"
arch=('any')
url="https://github.com/KIRILL100-10/temperature-converter-cli"
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KIRILL100-10/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6886ad7c74f96e02cacf261b77b3c621c3ac9481c6342ec75f1534e68186fb6a')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/${pkgname}"

    install -m644 main.py "${pkgdir}/usr/share/${pkgname}/main.py"

    echo -e "#!/bin/sh\nexec python /usr/share/${pkgname}/main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
