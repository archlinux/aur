# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks <neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>

pkgname=lantern-bin
pkgver=7.9.4
pkgrel=1
pkgdesc="A censorship circumvention tool that delivers fast, reliable, and secure access to the open internet"
arch=('x86_64')
url="https://lantern.io"
license=('Apache-2.0')
depends=('bash' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'hicolor-icon-theme' 'libayatana-appindicator')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!docs')
_commit=a3b9fcf7560c6399cabbce2b988e3ea3481520e4
source=("${pkgname}-${pkgver}.deb::https://github.com/getlantern/lantern-binaries/raw/${_commit}/lantern-installer-64-bit.deb"
        "${pkgname%-bin}.service")
sha256sums=('1b5bdf25920f6717b867c5207869e0fd7344d3a0ad96c5d5257b6bf374fc1ca8'
            'fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')

package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    install -Dm644 "${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
}
