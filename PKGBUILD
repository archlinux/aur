# Maintainer: Aaron Esau <contact@aaronesau.com>
pkgname="heaptrace"
pkgver="2.2.8"
pkgrel="1"
license=("BSD")
arch=("x86_64")
url="https://github.com/Arinerron/heaptrace"
pkgdesc="helps visualize heap operations for pwn and debugging"
source_x86_64=("${pkgname}-heaptrace::https://github.com/Arinerron/heaptrace/releases/download/${pkgver}/heaptrace" "${pkgname}-heaptrace.1::https://raw.githubusercontent.com/Arinerron/heaptrace/main/man/heaptrace.1")
sha256sums_x86_64=("7882bf4660c3516ce261f4b3c9f9cc5b946bf75e799c6090c45ac074d59a9ce9" "598cc86c6a74a5f43a6c65c9964c80fc5bfa61cea95d0f99eafd48f3a26007c2")
noextract=("${pkgname}-heaptrace" "${pkgname}-heaptrace.1")

package() {
    install -D "${srcdir}/${pkgname}-heaptrace" "${pkgdir}/usr/bin/heaptrace" --mode=755 --owner="root" --group="root"
    install -g 0 -o 0 -m 0644 -D "${srcdir}/${pkgname}-heaptrace.1" "${pkgdir}/usr/local/man/man1/heaptrace.1"
    gzip "${pkgdir}/usr/local/man/man1/heaptrace.1"
}
