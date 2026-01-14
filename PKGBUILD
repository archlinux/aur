# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
_pkgname="asus-5606-fan-state"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Script to set the fan state on the ZenBook S 16 UM5606 and Vivobook M5606"
arch=('any')
url="https://github.com/ThatOneCalculator/${_pkgname}"
license=('MIT')
depends=('dbus')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-git"
    "${_pkgname}-bin"
)
source=(
	"${url}/releases/download/v${pkgver}/fan_state"
	"https://raw.githubusercontent.com/ThatOneCalculator/asus-5606-fan-state/refs/heads/main/asus-fan-permissions.service"
)
options=("!strip")
sha256sums=('78a470ba209f4cf872290e3b64598ee03f7f6a670c270d6874b5a438c393c558'
            '6e3702343cf5dfbd43cc9ffd4dc45f9bf8d4649d75fdaa5cc02d1063958ede98')
install="${_pkgname}.install"

package() {
    install -Dm755 "$srcdir/fan_state" "$pkgdir/usr/bin/fan_state"
    install -Dm644 "$srcdir/asus-fan-permissions.service" "$pkgdir/usr/lib/systemd/system/asus-fan-permissions.service"
}
