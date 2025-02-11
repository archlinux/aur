# Maintainer: Igor Kulkov <xp.jfk9w@gmail.com>

pkgname=outline-ss-server-bin
pkgver=1.9.1
pkgrel=1
pkgdesc='Outline Shadowsocks server (binary)'
arch=('x86_64' 'aarch64' 'armv7h')
url='https://github.com/Jigsaw-Code/outline-ss-server'
license=('Apache-2.0')
depends=('glibc')
provides=('outline-ss-server')
backup=('etc/outline-ss-server/server.yml')
source=('outline-ss-server.conf'
        'outline-ss-server.service'
        'outline-ss-server.sysusers'
        'outline-ss-server.tmpfiles'
        'outline-ss-server.yml')
source_x86_64=("https://github.com/Jigsaw-Code/outline-ss-server/releases/download/v${pkgver}/outline-ss-server_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("https://github.com/Jigsaw-Code/outline-ss-server/releases/download/v${pkgver}/outline-ss-server_${pkgver}_linux_arm64.tar.gz")
source_armv7h=("https://github.com/Jigsaw-Code/outline-ss-server/releases/download/v${pkgver}/outline-ss-server_${pkgver}_linux_armv7.tar.gz")

package() {
    install -Dm755 'outline-ss-server' "${pkgdir}/usr/bin/outline-ss-server"
    install -Dm644 'outline-ss-server.conf' "${pkgdir}/etc/conf.d/outline-ss-server"
    install -Dm644 'outline-ss-server.yml' "${pkgdir}/etc/outline-ss-server/server.yml"

    install -Dm644 'outline-ss-server.service' "${pkgdir}/usr/lib/systemd/system/outline-ss-server.service"
    install -Dm644 'outline-ss-server.tmpfiles' "${pkgdir}/usr/lib/tmpfiles.d/outline-ss-server.conf"
    install -Dm644 'outline-ss-server.sysusers' "${pkgdir}/usr/lib/sysusers.d/outline-ss-server.conf"
}

sha256sums=('65e31f684f97fff667d99a128766e36a161da84ac4417100bea48b71849621e9'
            '733ea880a23d9d0f720be0e678a947fc2b1ede0d19af018b821978afac49c938'
            'fe125a55e76e2e016c5a9e38f9ce1a709af92d7b5bb65b3cd7b4ed7073e8ac57'
            '204058355c2e25d336c69acecaed712b274ecc0f0d2cc42f9d109a989fbdba4d'
            '703440fcbe804c60d589e707a044c09ad908ec0516b06a16c3ce922b46440172')
sha256sums_x86_64=('a1421408936026893916f2dee405fd002bcf7555c8e6fcd44c60855cd77c033c')
sha256sums_aarch64=('ba53f136aa120e48e2e16306fd3c11f04a3fb514058cc70e20667cedcbafdd35')
sha256sums_armv7h=('8a28329c70dcb2863530c531371c90379ec6e6cc8806615311b96c188ff7a8ef')
