# shellcheck disable=SC2034,SC2148,SC2128,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-bin
pkgver=1.1.1
pkgrel=1
depends=('pam')
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
sha256sums=('c4e82ae2c08c223ef417edca50f86f516e3f9154339f67110c87d01855673fcf'
            'a8d29e220c23b48b5cd3aac0c0e395e90a9d6c9ca9c9c35a45ad6f3df5f55542'
            '7f2fb91f55088be1a9b1c93ecf5d6c1e437f369b56df2eacc9d10b00c93c39f8'
            '5dbe088ce29c95a400080190560d4308c10519a953e83d2d5020dfdf47dd830f')

package() {
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm644 default-theme.ini "${pkgdir}/etc/lidm.ini"
    install -Dm644 lidm.1 "${pkgdir}/usr/share/man/man1/lidm.1"
    install -Dm644 lidm-config.5 "${pkgdir}/usr/share/man/man5/lidm-config.5"
}
