# Maintainer: Matthias Braun <me@matthiasbraun.eu>
pkgname=swaypwd-bin
pkgver=0.2.3
pkgrel=1
pkgdesc="Print the working directory of the foreground process in the focused Sway window"
arch=(x86_64)
url="https://gitlab.com/bullbytes/swaypwd"
license=(AGPL-3.0-or-later)
depends=()
optdepends=("python: Chromium local-file support")
provides=(swaypwd)
conflicts=(swaypwd swaypwd-git)
options=('!strip' '!debug')
source=(
    "swaypwd-${pkgver}-x86_64::https://gitlab.com/api/v4/projects/80488692/packages/generic/swaypwd/${pkgver}/swaypwd-x86_64"
    "swaypwd-${pkgver}-man.1::https://gitlab.com/api/v4/projects/80488692/packages/generic/swaypwd/${pkgver}/swaypwd.1"
    "LICENSE::https://gitlab.com/bullbytes/swaypwd/-/raw/v${pkgver}/LICENSE"
)
b2sums=('5000613783ec98f0425e9b456c7a1dcdbb4e51b4d767bbd8acdf05cfc9e20639b29e195dceb8416431f373ae10a046f88f4c46f1d18cd203ee951a85abc7a1a7'
        '5f8c8832b3be73b2a9f597c7713b13d06843dc08220575a352ee6c836686b25eac6317255091369980357d583874a033fc6db6499caa606d7084bd68ed9f4607'
        'b6829320f725e3e45c4807ef5deb4738a691fb3ab146d8531b81fdbccd8376a826c8ec76165985cdf37d534f68e395652c96841ba7636c4bd34c49b7c7b3a9ec')

package() {
    install -Dm755 "swaypwd-${pkgver}-x86_64" "$pkgdir/usr/bin/swaypwd"
    install -Dm644 "swaypwd-${pkgver}-man.1"  "$pkgdir/usr/share/man/man1/swaypwd.1"
    install -Dm644 LICENSE                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
