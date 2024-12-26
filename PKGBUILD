# shellcheck disable=SC2034,SC2148,SC2128,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-bin
pkgver=0.2.0
pkgrel=1
depends=('pam')
makedepends=('gzip')
pkgdesc="A fully colorful customizable TUI display manager made in C. (release binary)"
arch=('x86_64')
url="https://github.com/javalsai/lidm"
license=('GPL')
provides=('lidm')
conflicts=('lidm')
source=(
    "lidm::$url/releases/download/v$pkgver/lidm-amd64"
    "default-theme.ini::https://raw.githubusercontent.com/javalsai/lidm/v$pkgver/themes/default.ini"
    "lidm.1::https://raw.githubusercontent.com/javalsai/lidm/v$pkgver/assets/man/lidm.1"
    "lidm-config.5::https://raw.githubusercontent.com/javalsai/lidm/v$pkgver/assets/man/lidm-config.5"
)
sha256sums=('65b42f4f7acd970b167fe84d1fa75450b54e01a6f0edddb9d8dd487058a20850'
            '68662430a6d262b35cc54d9f0e164ed935b7f7f4497a87cc94946c558bbe8a91'
            'a6807a55ff72ec5a5678583156b3efd0d367f0bcb79854094132771f0cb86bce'
            '3adaae60f79dff1cef2b2aba7dcea04196cd49816759ad36afb9f7331ac9c3e4')

package() {
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm644 default-theme.ini "${pkgdir}/etc/lidm.ini"
    install -Dm644 lidm.1 "${pkgdir}/usr/share/man/man1/lidm.1"
    install -Dm644 lidm-config.5 "${pkgdir}/usr/share/man/man5/lidm-config.5"
    gzip -f "${pkgdir}"/usr/share/man/man{1/lidm.1,5/lidm-config.5}
}
