# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=valvefm-bin
pkgver=0.1.8
pkgrel=1
pkgdesc="Vintage FM radio TUI for radio-browser.info stations"
arch=('x86_64' 'aarch64')
url="https://github.com/zorig/valvefm"
license=('MIT')
depends=('alsa-lib' 'glib2' 'glibc' 'gtk3' 'libayatana-appindicator')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/zorig/valvefm/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64-valvefm::${_dl}/valvefm-linux-amd64"
            "${pkgname}-${pkgver}-x86_64-valvefm-tui::${_dl}/valvefm-tui-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64-valvefm::${_dl}/valvefm-linux-arm64"
            "${pkgname}-${pkgver}-aarch64-valvefm-tui::${_dl}/valvefm-tui-linux-arm64")
sha256sums=('1126322e2cc8d165adc4c792eeb195717de2bcc7b39be1ce77959d78e87ef685')
sha256sums_x86_64=('11c3a27bd882e8ca521b0607ed1629acaf986af4f9e43ed0ea3af4f9facb25a2'
                   'ae3cf99eb759a268031b66ed3b12d25465bd85e7221ddec07ec9ee15b6496703')
sha256sums_aarch64=('cd3d14f98dc3a259dc138dc98db4963e202a03643943d72b31eafcbfd19f516b'
                    '03239f18dfa391077c2136c8b0025b8a76e94b5d2cc58dd76725bcfd24de6488')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-valvefm" "${pkgdir}/usr/bin/valvefm"
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}-valvefm-tui" "${pkgdir}/usr/bin/valvefm-tui"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
