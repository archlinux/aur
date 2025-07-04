# shellcheck disable=SC2034,SC2148,SC2128,SC2154,SC2164
# Maintainer: javalsai <javalsai@proton.me>
pkgname=lidm-bin
pkgver=1.2.0
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
sha256sums=('6bf4403c21bd26607302d99d7bd1a129822e7d2506e949fb483ea445e022eb6d'
            'ffaa5fe2cf5011bf53c90f81bfec8585158d35f72c0666db0bd4d3866ae041ca'
            '7f2fb91f55088be1a9b1c93ecf5d6c1e437f369b56df2eacc9d10b00c93c39f8'
            '0aa5755bdcc60ea80cd9ee0f89233ffaf22c6cee9db9da277274a62c6ed477d9')

package() {
    install -Dm755 lidm "${pkgdir}/usr/bin/lidm"
    install -Dm644 default-theme.ini "${pkgdir}/etc/lidm.ini"
    install -Dm644 lidm.1 "${pkgdir}/usr/share/man/man1/lidm.1"
    install -Dm644 lidm-config.5 "${pkgdir}/usr/share/man/man5/lidm-config.5"
}
