pkgname=lidm-bin
pkgver=0.0.1
pkgrel=3
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
    '4969018d527613729336abd51e37283ce77d7c7a2233434642804b88e550e622'
    '27db9b0cd2da80c0c60dcb13dfad0f9d65e7dddbb7b344b859803b9ac3943cd7'
)

package() {
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm755 default-theme.ini "${pkgdir}/etc/lidm.ini"
}
