pkgname=osu-fetch
pkgver=1.0.0
pkgrel=6
pkgdesc="A stylish fetch utility for osu! players"
arch=('any')
url="https://github.com/test2793/osu-fetch"
license=('MIT')
depends=('python' 'python-requests')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/test2793/osu-fetch/archive/refs/tags/v1.0.0.tar.gz"
        "osu-fetch.sh")
sha256sums=('a6e4d776495df0be24cbf5cd93cb21fb322300b9a896aa3193e25ebf9b3e1f5c'
            '8b9b87df8f15b80c35d88da0df27282a514d4ef7579178229b3b8ef184a4bca8')

package() {
    install -d "${pkgdir}/usr/share/osu-fetch"
    install -d "${pkgdir}/usr/bin"

    # Ищем osufetch.py в папке src и копируем его, где бы он ни лежал
    find "${srcdir}" -name "osufetch.py" -exec install -m644 {} "${pkgdir}/usr/share/osu-fetch/osufetch.py" \;

    # Копируем bash-скрипт запуска
    install -m755 "${srcdir}/osu-fetch.sh" "${pkgdir}/usr/bin/osu-fetch"
}
