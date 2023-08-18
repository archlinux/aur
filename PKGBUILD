# Maintainer: noobping <hello@noobping.dev>
# Maintainer: schmidtandreas <mail@schmidt-andreas.de>

pkgname=wofi-pass
pkgver="$(curl --silent https://api.github.com/repos/schmidtandreas/wofi-pass/releases/latest | grep "tag_name" | cut -d ":" -f 2 | sed "s|.*\"\(.*\)\".*|\1|")"
pkgrel=1
pkgdesc="A Wayland-native interface for conveniently using pass"
arch=('any')
url='https://github.com/schmidtandreas/wofi-pass'
license=('GPL')
depends=('coreutils' 'findutils' 'grep' 'man-pages' 'pass' 'tcl' 'util-linux' 'wl-clipboard' 'wofi')
optdepends=('wtype: type support'
            'pass-otp: OTP support')
source=("https://github.com/schmidtandreas/wofi-pass/releases/download/${pkgver}/wofi-pass" 
        "https://github.com/schmidtandreas/wofi-pass/releases/download/${pkgver}/wofi-pass.1.gz")
sha256sums=('fa9b83de483e6dd281285420117105175379a29245f26a1166848e8cced0c1d4'
            'cb355afb6180dd6d92ed46a804cbffd2ca2acd72762da0eb7bb89b7ba58486b4')
noextract=("wofi-pass.1.gz")

package() {
    mkdir -p "$pkgdir"/usr/bin
    mkdir -p "$pkgdir"/usr/share/man/man1
    install -m755 "wofi-pass" "$pkgdir"/usr/bin/wofi-pass
    install -m755 "wofi-pass.1.gz" "$pkgdir"/usr/share/man/man1/wofi-pass.1.gz
}
