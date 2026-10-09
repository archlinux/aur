pkgname=nekokolpa2
pkgver=2.2.6
pkgrel=588
pkgdesc='Cross-platform eSIM management app for working with local eUICCs, external readers, and remote reader endpoints'
arch=(x86_64)
url='https://github.com/iebb/NekokoLPA2'
license=(MIT)
depends=(bubblewrap gtk3)
options=(!debug)
makedepends=()
source=("https://github.com/iebb/NekokoLPA2/releases/download/v${pkgver}%2B${pkgrel}/ee.nekoko.nlpa2.linux-${pkgver}-${pkgrel}-x64.tar.gz")
sha256sums=('68728ed6de131eb14593cf6a58c0ad4909739c04ca84ed45d1b9dcd77bf89ad0')

package() {
    install -Dm755 "${startdir}/nlpa2.sh" "${pkgdir}/usr/bin/nlpa2"
    install -Dm644 "${startdir}/nlpa2.desktop" "${pkgdir}/usr/share/applications/nlpa2.desktop"
    install -Dm755 "${srcdir}/nlpa2" "${pkgdir}/usr/share/nlpa2/nlpa2"
    cp -rp "${srcdir}"/{data,lib} "${pkgdir}/usr/share/nlpa2/"
}
