# Maintainer: Eric Dahl <eric@skeyelab.com>
# Rendered by render.sh from PKGBUILD.in for each release (#78); don't edit the rendered copy.
pkgname=phrased-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Types phrases from the Phrasedeck iPhone app into the focused window (Wayland)"
arch=('x86_64' 'aarch64')
url="https://github.com/ericdahl-dev/phrasedeck"
license=('LicenseRef-Proprietary')
depends=('wtype' 'wl-clipboard')
optdepends=('ydotool: typing on GNOME or KDE (Wayland)'
            'xdotool: typing on X11'
            'xclip: pasting on X11'
            'libnotify: the notice when a Phrase edited on a panel is first typed')
provides=('phrased')
conflicts=('phrased')
install=phrased-bin.install
source_x86_64=("https://github.com/ericdahl-dev/phrasedeck/releases/download/v${pkgver}/phrased-${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/ericdahl-dev/phrasedeck/releases/download/v${pkgver}/phrased-${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('ecc0ac2d184e3432747c1771adf788b3381c7abf9bf0d3d0635e7f2424b62d97')
sha256sums_aarch64=('9ed0d9989e7c9c5313142e8f90d0cf09691b726c8477d92c524cacf00462915f')

package() {
	install -Dm755 phrased "$pkgdir/usr/bin/phrased"
	# Not enabled: each user turns it on (phrased-bin.install says how).
	install -Dm644 phrased.service "$pkgdir/usr/lib/systemd/user/phrased.service"
}
