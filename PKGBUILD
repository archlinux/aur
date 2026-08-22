pkgname=radar-bin
pkgver=1.11.0
pkgrel=1
pkgdesc="Open source Kubernetes UI - binary"
arch=('x86_64')
url="https://github.com/skyhook-io/radar"
license=('Apache-2.0')
depends=('gtk3' 'webkit2gtk-4.1')
provides=('radar-desktop')
conflicts=('radar-desktop')
options=('!strip')

source=("radar-desktop-${pkgver}-x86_64.deb::https://github.com/skyhook-io/radar/releases/download/v${pkgver}/radar-desktop_v${pkgver}_linux_amd64.deb")
sha256sums=('4b98aacd48765447f0ce0d5497a6b42f04080f4b322b26188e1f0f51884aa2f3')

package() {
    cd "$srcdir"

    # .deb is an ar archive containing control.tar.gz + data.tar.gz + debian-binary
    ar x "radar-desktop-${pkgver}-x86_64.deb"
    bsdtar -xf data.tar.gz -C "$pkgdir"
}
