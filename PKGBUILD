# shellcheck disable=SC2034,SC2148,SC2128,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-bin
pkgver=0.1.0
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
sha256sums=('b5d1dbdaa6b78da57be69ce5e2cc3366717a045de3cb316e66c1c3f36b796ee0'
            '27db9b0cd2da80c0c60dcb13dfad0f9d65e7dddbb7b344b859803b9ac3943cd7'
            'a6807a55ff72ec5a5678583156b3efd0d367f0bcb79854094132771f0cb86bce'
            'c44f78940212b946e157eac02e159b215376d291d11adfe4925b594405ad85da')

package() {
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm644 default-theme.ini "${pkgdir}/etc/lidm.ini"
    install -Dm644 lidm.1 "${pkgdir}/usr/share/man/man1/lidm.1"
    install -Dm644 lidm-config.5 "${pkgdir}/usr/share/man/man5/lidm-config.5"
    gzip -f "${pkgdir}"/usr/share/man/man{1/lidm.1,5/lidm-config.5}
}
