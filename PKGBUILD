# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: neo.shadowsocks<neo.shadowsocks AT gmx.com>
# Contributor: Kars Wang <jaklsy g-mail>
# Contributor: Artem Klevtsov <a.a.klevtsov@gmail.com>
pkgname=lantern-bin
pkgver=7.7.0
pkgrel=1
pkgdesc="A censorship circumvention tool that delivers fast, reliable, and secure access to the open internet"
arch=('x86_64')
url="https://lantern.io"
license=('Apache')
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-headless")
provides=("${pkgname%-bin}")
depends=('bash'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk3'
         'libayatana-appindicator')
options=('!emptydirs' '!docs')
source=("${pkgname}-${pkgver}.deb::https://github.com/getlantern/lantern-binaries/raw/main/${pkgname%-bin}-installer-64-bit.deb"
        "${pkgname%-bin}.service")
sha256sums=('4f8a459fc34a9845abe5c38f18c7f99b6be81e696180d89c0f872b5a8d2736a5'
            'fdece37945be10c00210bbde7b4058c356ef1df0554bd963fcddd12990ff930b')

package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"
    install -Dm644 "${pkgname%-bin}.service" -t "${pkgdir}/usr/lib/systemd/user"
}
