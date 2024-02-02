# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks <neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>
pkgname=lantern-bin
pkgver=7.8.0
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
options=('!docs')
_commit='84648491a4b6e7b8e50b2790677dc47be132b890'
source=("${pkgname}-${pkgver}.deb::https://github.com/getlantern/lantern-binaries/raw/${_commit}/lantern-installer-64-bit.deb"
        "${pkgname%-bin}.service")
sha256sums=('a782457bdec8bc7a0d5a8437aa6fca7bb3a2d8bcc37ca4e0d3d3340c986036de'
            'fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')

package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    install -Dm644 "${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user/"
}
