# Maintainer: 4679 <4679@pm.me>
# Co-Maintainer: DuckSoft <realducksoft@gmail.com>

pkgname=shadowsocks-rust-bin
pkgver=1.11.2
pkgrel=1
pkgdesc='A Rust port of shadowsocks https://shadowsocks.org/ (binary version)'
arch=('x86_64')
url='https://github.com/shadowsocks/shadowsocks-rust'
license=('MIT')
depends=('openssl')
provides=('shadowsocks-rust')
conflicts=('shadowsocks-rust')
source=(
    "${url}/releases/download/v${pkgver}/shadowsocks-v${pkgver}.x86_64-unknown-linux-gnu.tar.xz"
    "${url}/raw/v${pkgver}/examples/config.json"
    "${url}/raw/v${pkgver}/examples/config_ext.json"
    "shadowsocks-rust@.service::https://aur.archlinux.org/cgit/aur.git/plain/shadowsocks-rust@.service?h=shadowsocks-rust-git"
    "shadowsocks-rust-server@.service::https://aur.archlinux.org/cgit/aur.git/plain/shadowsocks-rust-server@.service?h=shadowsocks-rust-git"
)
sha512sums=('26834fd2c30565edaf130443f428296e3383366ece4774e6e9628f69ad7cf9ea9dc2ee9246c2bb1b22c7b9d270ed34a73e10076aa8f8b24c2f9bb3ccb43e7d1d'
            '9a0b81d82bf897c5461d75d941cd604cbd7f32d00c2bf775f17b37b77fcf5734903d2ec666ba9a6a340e77f31018b5dbbb8ea597797c6a00c6b1f3e2f47127e6'
            '4ac52e6fe04e02543f54d57fccfd863f18b157fd28fb61c9a56ba46269b9dff410a80960943d911afa55b45c3fc42e98d91f8bb75e9103abf3f3dbfffb73a6e0'
            'fccb02b922369a6ba01e7d438bd8bf306fe25b15d54e0a91e33832bd2726add8e9c01705f1f7a3afe44f3034f6438c3cc8c0fcad8905d67cb789f4f21feef102'
            '573df735263cafc37f5eb315aa5de106141a787a3dfb98a47499f8ed196ca32f1873a644188685512f5e58e062049674c4bcdf6ca9a87ee8dfb840614c69bb55')

    package() {
        cd "${srcdir}"
        install -Dm755 sslocal "${pkgdir}/usr/bin/sslocal-rust"
        install -Dm755 ssserver "${pkgdir}/usr/bin/ssserver-rust"
        install -Dm755 ssurl "${pkgdir}/usr/bin/ssurl-rust"
        install -Dm755 ssmanager "${pkgdir}/usr/bin/ssurl-rust"
        install -Dm644 shadowsocks-rust@.service "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust@.service"
        install -Dm644 shadowsocks-rust-server@.service "${pkgdir}/usr/lib/systemd/system/shadowsocks-rust-server@.service"
        install -Dm644 config_ext.json "${pkgdir}/etc/shadowsocks/config_ext_rust.json.example"
        install -Dm644 config.json "${pkgdir}/etc/shadowsocks/config_rust.json.example"
    }

