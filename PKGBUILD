pkgname=nekokolpa2
pkgver=2.5.0
pkgrel=606
pkgdesc='Cross-platform eSIM management app for working with local eUICCs, external readers, and remote reader endpoints'
arch=(x86_64)
url='https://github.com/iebb/NekokoLPA2'
license=(MIT)
depends=(bubblewrap gtk3)
options=(!debug)
makedepends=()
source=("https://github.com/iebb/NekokoLPA2/releases/download/v${pkgver}%2B${pkgrel}/ee.nekoko.nlpa2.linux-${pkgver}-${pkgrel}-x64.tar.gz")
sha256sums=('ceeaba80abffa735572c157c395e92d2c7410d5fc450e01c0f5ff8ef5044d3cd')

package() {
    install -Dm755 "${startdir}/nlpa2.sh" "${pkgdir}/usr/bin/nlpa2"
    install -Dm644 "${startdir}/nlpa2.desktop" "${pkgdir}/usr/share/applications/nlpa2.desktop"
    install -Dm755 "${srcdir}/nlpa2" "${pkgdir}/usr/share/nlpa2/nlpa2"
    install -Dm644 "${startdir}/LICENSES/MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cp -rp "${srcdir}"/{data,lib} "${pkgdir}/usr/share/nlpa2/"
}
