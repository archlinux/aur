# Maintainer: Que Quotion <quequotion@mailinator.com>

pkgname=throttlectl
pkgver=11
pkgrel=1
pkgdesc="Command-line user discretion power managment utility"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=180762"
license=('GPL')
depends=('bash')
optdepends=('hdparm' 'nvidia-utils' 'iw' 'ethtool')
backup=(etc/throttle.d/{powersave,performance,systemstate,powermizer})
source=('throttlectl'
        'throttle-cut.service'
        'powersave'
        'performance'
        'systemstate'
        'powermizer')
sha512sums=('454afc229e60c64e74280c0eea64e5dd838f5c428c0aa13dd47e12c6b58d4477f7b2318a085bffc0b3df6550a80fc95d11f2b45aa64235b8fbb766c31d1a88d7'
            '6254e73446a91ea7945b9e4db1a1047eb2055d93aee315006857711ab21cba140da3badcf5834d2628e4799494a069647d11aa378a9bac67691df8d8b3adc12f'
            '926f7c787aea8c1027f331fe2e9417ba8e4f15a79f51610baafeed5d0de86d8f41da92f4460c29a5ce251e7cc110e26c2c344931af91949dc529595cc18c0f0e'
            '5e9318698bac00e07680e58b8e1abdf93b38895f55040b68178cce0307a84624a1a9220470286b33219f1f16160c456fa4f016682c901d0e9bb7cf6c240458e8'
            '31bca02094eb78126a517b206a88c73cfa9ec6f704c7030d18212cace820f025f00bf0ea68dbf3f3a5436ca63b53bf7bf80ad8d5de7d8359d0b7fed9dbc3ab99'
            '31bca02094eb78126a517b206a88c73cfa9ec6f704c7030d18212cace820f025f00bf0ea68dbf3f3a5436ca63b53bf7bf80ad8d5de7d8359d0b7fed9dbc3ab99')

package() {
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/throttlectl
  install -Dm644 {${srcdir},${pkgdir}/etc/throttle.d}/powersave
  install -Dm644 {${srcdir},${pkgdir}/etc/throttle.d}/performance
  install -Dm644 {${srcdir},${pkgdir}/etc/throttle.d}/systemstate
  install -Dm644 {${srcdir},${pkgdir}/etc/throttle.d}/powermizer

  install -Dm644 {${srcdir},${pkgdir}/etc/systemd/system}/throttle-cut.service
  #install -Dm644 {${srcdir},${pkgdir}/etc/udev/rules.d}/throttle-runtime-pm.rules

}
