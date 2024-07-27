pkgname=lidm-bin
pkgver=0.0.1
pkgrel=1
depends=('pam')
pkgdesc="A fully colorful cutomizable TUI display manager made in C. (release binary)"
arch=('x86_64')
url="https://github.com/javalsai/lidm"
license=('GPL')
provides=('lidm')
conflicts=('lidm' 'lidm-git')
source=(
    "lidm::$url/releases/download/$pkgver/lidm-$arch"
    "default-theme.ini::https://raw.githubusercontent.com/javalsai/lidm/$pkgver/themes/default.ini"
    "LICENSE::https://raw.githubusercontent.com/javalsai/lidm/$pkgver/LICENSE"
)
sha256sums=(
    '4969018d527613729336abd51e37283ce77d7c7a2233434642804b88e550e622'
    '27db9b0cd2da80c0c60dcb13dfad0f9d65e7dddbb7b344b859803b9ac3943cd7'
    '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
)

package() {
    install -Dm755 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm755 default-theme.ini "${pkgdir}/etc/lidm.ini"
}
