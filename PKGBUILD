# Maintainer: Yakkhini <sign@yechanv.cc>
pkgname='weye'
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight screenshot tool for sway, writen in Rust."
arch=('x86_64')
url="https://github.com/Yakkhini/Weye"
license=('custom:Mulan PSL v2')
depends=(gtk3 grimshot libnotify)
source=("https://github.com/Yakkhini/Weye/releases/download/v0.1.0/weye"
        "https://github.com/Yakkhini/Weye/releases/download/v0.1.0/default.toml"
        "https://github.com/Yakkhini/Weye/releases/download/v0.1.0/icon.svg"
        "https://github.com/Yakkhini/Weye/releases/download/v0.1.0/LICENSE")
noextract=("${source[@]%%::*}")
sha256sums=('e6ae16e10597f7b12badd3ca8e0eec4f3753754ef22f1f4d8bc54959e55bda67'
            '6e8876de9fda676909cac1af8c7669b56150b5ad76ef8f2521f02e246783f180'
            '8a5efa5e039bc83b5ca879e154a258e13c2ec8ba46ed32c01fb83cdb5180063b'
            '03a5954817ed705c1a1876d093aa23395d04aff570a7cba753f7d1bbfa1f6b11')

package() {
    install -Dm755 "weye" "${pkgdir}/usr/bin/weye"
    install -Dm644 "default.toml" "${pkgdir}/etc/weye/config.toml"
    install -Dm644 "default.toml" "${pkgdir}/usr/share/weye/default.toml"
    install -Dm644 "icon.svg" "${pkgdir}/usr/share/weye/icon.svg"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/weye/LICENSE"
}
