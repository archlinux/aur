# Maintainer: Nathaniel van Diepen <eeems@eeems.email>
pkgname=vorta-root
pkgver=0.0.1
pkgrel=4
url=https://github.com/eeems/vorta-root
pkgdesc="Run vorta as root without having to enter a password"
arch=(any)
source=(com.borgbase.Vorta_root.rules
        com.borgbase.Vorta_root.desktop
        com.borgbase.Vorta.policy
        LICENSE)
md5sums=('30e9837eee6f8ae58b23f61ba4eb526c'
         'a3ffc1ab23c2aca6bb6bdd36a5ce2970'
         '1e61e042153d350ea69da6d2237a10c5'
         'e37c0031ec710628a8f77bbacae131ec')
depends=(vorta)
license=(MIT)
package() {
    mkdir -pm755 "$pkgdir/usr/share/polkit-1"
    mkdir -m750 "$pkgdir/usr/share/polkit-1/rules.d"
    install -Dm644 "$srcdir/com.borgbase.Vorta_root.desktop" "$pkgdir/usr/share/applications/com.borgbase.Vorta_root.desktop"
    install -Dm644 "$srcdir/com.borgbase.Vorta_root.rules" "$pkgdir/usr/share/polkit-1/rules.d/com.borgbase.Vorta_root.rules"
    install -Dm644 "$srcdir/com.borgbase.Vorta.policy" "$pkgdir/usr/share/polkit-1/actions/com.borgbase.Vorta.policy"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
