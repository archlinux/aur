# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-bin
pkgver=0.0.2
pkgrel=1
depends=('pam')
pkgdesc="A fully colorful cutomizable TUI display manager made in C. (release binary)"
arch=('x86_64')
url="https://github.com/javalsai/lidm"
license=('GPL')
provides=('lidm')
conflicts=('lidm')
source=(
    "lidm::$url/releases/download/$pkgver/lidm-$arch"
    "default-theme.ini::https://raw.githubusercontent.com/javalsai/lidm/$pkgver/themes/default.ini"
)
sha256sums=(
    'b5d1dbdaa6b78da57be69ce5e2cc3366717a045de3cb316e66c1c3f36b796ee0'
    '27db9b0cd2da80c0c60dcb13dfad0f9d65e7dddbb7b344b859803b9ac3943cd7'
)

package() {
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm644 default-theme.ini "${pkgdir}/etc/lidm.ini"
}
