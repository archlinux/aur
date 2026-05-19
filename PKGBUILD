pkgname=osu-fetch
pkgver=1.0.0
pkgrel=9
pkgdesc="A stylish fetch utility for osu! players"
arch=('any')
url="https://github.com/test2793/osu-fetch"
license=('MIT')
depends=('python' 'python-requests')
# Качаем оба файла напрямую из репозитория, без архивов!
source=("osu-fetch.sh"
        "osufetch.py::https://raw.githubusercontent.com/test2793/osu-fetch/main/osufetch.py")
sha256sums=('a5dff6b37bebe2780ab8ae035db5b6baf4fadd63ca25242cbdc65542eadbb25b'
            'SKIP')

package() {
    install -d "${pkgdir}/usr/share/osu-fetch"
    install -d "${pkgdir}/usr/bin"

    # Теперь оба файла лежат прямо в корне src/, копируем их без лишних папок
    install -m644 "${srcdir}/osufetch.py" "${pkgdir}/usr/share/osu-fetch/osufetch.py"
    install -m755 "${srcdir}/osu-fetch.sh" "${pkgdir}/usr/bin/osu-fetch"
}
