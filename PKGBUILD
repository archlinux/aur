# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks <neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>
pkgname=lantern-bin
pkgver=7.7.2
pkgrel=1
pkgdesc="A censorship circumvention tool that delivers fast, reliable, and secure access to the open internet"
arch=('x86_64')
url="https://lantern.io"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
depends=('bash'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk3'
         'hicolor-icon-theme'
         'libayatana-appindicator')
options=('!emptydirs' '!docs')
_commit='4961516ac6bdf8b04dae08fede69cd77d1f43e5d'
source=("${pkgname}-${pkgver}.deb::https://github.com/getlantern/lantern-binaries/raw/${_commit}/lantern-installer-64-bit.deb"
        "${pkgname%-bin}.service")
sha256sums=('d96f051401634c86664c80375956df7b6ad8f6af2e46ad3e27573d2dc6937cf7'
            'fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')

package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    install -Dm644 "${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user/"
}
