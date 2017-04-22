# Maintainer: Simon Doppler (dopsi) <dopsi _at_ dopsi _dot_ ch>
pkgname=cachet-monitor-bin
pkgver=3.0
pkgrel=1
pkgdesc='Distributed monitoring plugin for CachetHQ'
arch=('x86' 'x86_64')
url="https://github.com/CastawayLabs/cachet-monitor"
license=('MIT')
source=(
    "cachet_monitor::https://github.com/CastawayLabs/cachet-monitor/releases/download/v3.0/cachet_monitor_linux_amd64"
    "https://raw.githubusercontent.com/CastawayLabs/cachet-monitor/v3.0/readme.md"
    "https://raw.githubusercontent.com/CastawayLabs/cachet-monitor/master/example.cachet-monitor.service"
    "https://raw.githubusercontent.com/CastawayLabs/cachet-monitor/v3.0/example.config.json"
    "https://raw.githubusercontent.com/CastawayLabs/cachet-monitor/v3.0/example.config.yml"
    )
sha512sums=('b7cc779e4174c96afa144dbd5c1b7be70c7fcdfa90b803640c8b849b532fc11a0111323e75c4686f1f32d1294ec40bf059bf6140bdfcecf1c628878ea208b2c2'
            'efd463c192cb0f9d1c8c020f5a6058fcb7c998462f041eb084ee6a71e6643e58f2c6b1d4ba409e746e567efe051005bda8c52289860021b509de50e854ab5722'
            '7f0d86edd56d2c47e2e99e95bf7fee32a421027fff562f457c834ae0b87d2fb63a311b06e2da461d076d17894df77a79a73307516984e3b3d466cf3e82da309b'
            '28508bd0f8615387f7bc525eae317cdac889aaa6b04e59b433ddcc69901a9e1ee82eb4c5d98d882484783db7ded714fd54c43fbeb75fd229df35d4f3b1847f91'
            '8f8d789c000bd09be6a3bca8be5b4d3b5ea16b34ede48049e38732584235dbbf0f80117d443c5234f02a76c2e1750041369e044c3177236b7fb535bb406dbf2e')

package() {
    install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/doc/$pkgname" "$pkgdir/usr/share/licenses/$pkgname"
    cd "$srcdir"
    install cachet_monitor "$pkgdir/usr/bin"
    install example.cachet-monitor.service "$pkgdir/usr/share/doc/$pkgname"
    install example.config.yml "$pkgdir/usr/share/doc/$pkgname"
    install example.config.json "$pkgdir/usr/share/doc/$pkgname"
    sed -n '/MIT License/,$p' readme.md >> "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:ts=4:sw=4:expandtab
