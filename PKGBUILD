# Maintainer: Kyle Manna <kyle [at] kylemanna [dot] com>

_pkgbin=helium-ledger-app
pkgname=helium-ledger-app-bin
pkgdesc='Helium Application for Ledger'
license=('Apache')
url='https://github.com/helium/helium-ledger-app'
pkgver=1.1.2
pkgrel=1
arch=('x86_64')
package="helium-ledger-app-${pkgver}-x86_64-unknown-linux-gnu.zip"
#options=(!strip)
# TODO explore source build, requires BOLOS SDK pkg
depends=('openssl-1.0')
provides=('helium-ledger-app')
conflicts=('helium-ledger-app')
source=(
  "${package}::${url}/releases/download/${pkgver}/${package}"
)
sha512sums=('0db9f730732de7f3cd0819e651de57c722406094de50801adf805e839bd57d93f5fa0a644adcb5a9fbb90fc63d464bb93f7f35a14fe181eaa2a1a899e8e85274')

package() {
    cd ${package%.zip}
	install -Dt "$pkgdir/opt/${_pkgbin}/" helium-ledger-app

	install -d "$pkgdir/usr/bin"
	ln -s "../../opt/$_pkgbin/$_pkgbin" "$pkgdir/usr/bin/$_pkgbin"
}
