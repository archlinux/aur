# Maintainer: 4RC3UZ <l4rc3uz@gmail.com>

pkgname=osu-fetch
pkgver=1.0.0
pkgrel=1
pkgdesc="A sleek, CLI fetch tool for osu! player statistics"
arch=('any')
url="https://github.com/test2793/osu-fetch"
license=('MIT')
depends=('python' 'python-requests')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/test2793/osu-fetch/archive/refs/tags/v${pkgver}.tar.gz"
        "osu-fetch.sh")
sha256sums=('8de106388615341c470c2bccaa572b3d2af0a5a0276a8892f2ccca0aca09997a'
            'a5dff6b37bebe2780ab8ae035db5b6baf4fadd63ca25242cbdc65542eadbb25b')

package() {
    # Создаем директории в фиктивном корне пакета
    install -d "${pkgdir}/usr/share/osu-fetch"
    install -d "${pkgdir}/usr/bin"

    # Копируем сам скрипт Python
    install -m644 "${srcdir}"/*/osufetch.py "${pkgdir}/usr/share/osu-fetch/osufetch.py"


    # Бросаем запускатор в системный PATH и делаем его исполняемым
    install -m755 "${srcdir}/osu-fetch.sh" "${pkgdir}/usr/bin/osu-fetch"
}
