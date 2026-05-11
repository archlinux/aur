# Maintainer: shiwenwen <shiwenwendevelopment@gmail.com>

pkgname=hope-agent-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Local-first AI assistant desktop app — cross-device sessions, IM channel routing'
arch=('x86_64')
url='https://github.com/shiwenwen/hope-agent'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('hope-agent')
conflicts=('hope-agent')
options=('!strip' '!debug')
source=("hope-agent-${pkgver}.deb::${url}/releases/download/v${pkgver}/Hope.Agent_${pkgver}_amd64.deb")
sha256sums=('518f65229424c947f25e24b6d9a36ce9b86506cb81f93a56923a5ae8d14c85d7')

package() {
    bsdtar -xf "${srcdir}/hope-agent-${pkgver}.deb" -C "${srcdir}"
    bsdtar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
