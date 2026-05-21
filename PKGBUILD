# Maintainer: KIRILL100-10 (Kirill Nadtochaev) <Kirillnadtocaev@gmail.com>
pkgname=temperature-converter-cli
pkgver=1.0
pkgrel=1
pkgdesc="Simple and lightweight CLI temperature converter with RU/EN localization"
arch=('any')
url="https://github.com/KIRILL100-10/temperature-converter-cli"
license=('MIT')
depends=('python')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KIRILL100-10/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9366951a7ab64d0fb72dc378e142e54a7671acac8ee80d377aef455d5a3c3ed8')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/${pkgname}"

    install -m644 main.py "${pkgdir}/usr/share/${pkgname}/main.py"

    echo -e "#!/bin/sh\nexec python /usr/share/${pkgname}/main.py \"\$@\"" > "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
}

