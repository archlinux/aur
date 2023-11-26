# Maintainer: Diego Miguel <hello@diegomiguel.me>
# Maintainer: Gustavo Castro <gustawho@gmail.com>
# Contributor: Dmitry Porunov <dmitry@ykkz.de>

pkgname=ttf-apple-emoji
pkgver=16.4
pkgrel=4
pkgdesc='Apple Color Emoji is a color typeface used by iOS and macOS to display emoji'
arch=('any')
url='https://github.com/samuelngs/apple-emoji-linux'
license=('custom')
provides=(emoji-font)
depends=()
conflicts=(
    'noto-fonts-emoji'
    'ttf-symbola'
    'ttf-joypixels'
    'ttf-twemoji-color'
    'ttf-whatsapp-emoji'
)

source=(
    "AppleColorEmoji.ttf::$url/releases/download/v16.4-patch.1/AppleColorEmoji.ttf"
    "66-apple-emoji.conf"
)

sha512sums=(
    "c91dac619e71832fd5fa36550c94f0cda8fb4554b449e3c30db617654e9680f7c350c1ee76d5d774bab4279478e1d4fa92930e68eebb4ed5455169538301ec98"
    "e34f2c1c15b816034f29cc47af470d83e61ad910394bb4463e0e9b6fbcba3f2afef22fd2b58da3abe67c70227aade26d26bb68f19f0761cb4ae01e1d1d42c09c"
)

package() {
    install -dm 755 "${pkgdir}/usr/share/fonts/TTF"
    install -m 644 AppleColorEmoji.ttf "${pkgdir}/usr/share/fonts/TTF/"

    # Install fontconfig files
    install -Dm 644 66-apple-emoji.conf -t "${pkgdir}/usr/share/fontconfig/conf.avail/"
    install -d "${pkgdir}/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/66-apple-emoji.conf" "${pkgdir}/etc/fonts/conf.d/"
}

