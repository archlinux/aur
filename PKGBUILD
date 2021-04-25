# Maintainer: 4679 <4679@pm.me>

pkgname=shadowsocks-rust-bin
pkgver=1.10.6
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
sha512sums=('10378842fce6ca5bb708d8c2933f7c855f0f84a63136d589a70331dc1a66d8e06061696ac25948ada38ac79ee6273a1199076dab3da40a1ae5ef3acc162aea83'
            'c143767fdf60497f6661de0067448f1ba3eed9d654548739fbc480b721f11e8f8bef856e77ed09e7b95f0e8e7b5f69ed0f18d759f538b0555c58c832ea9138f5'
            '4ac52e6fe04e02543f54d57fccfd863f18b157fd28fb61c9a56ba46269b9dff410a80960943d911afa55b45c3fc42e98d91f8bb75e9103abf3f3dbfffb73a6e0'
            '3f56e02462ba8fa0a1cf62eaae5b796d7efb31ae1a8383a1132878244c1ab834ca3e23befa4c0c14c461c9883522d4f54f80aba45cd6331061bdd42618cbcfc6'
            '770c50dd191f29e4fb42d3273970b9c49c33fc1ca347b0f73fc34e04955f98ce1ca9486435c809bbb535fe79edb54c0107f37501e771a9cc9cc6ab727b596c6d')

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

