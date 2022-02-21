# Maintainer: Que Quotion <quequotion@mailinator.com>

pkgname=throttlectl
pkgver=10
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
sha512sums=('624940de7e63dead2931b7899357bdeab218d993987943c5753571ff8f77bb75d522e10bb38ddf46658e36e973b6d15ce7d130b67ea3fcc6389ded3ed45d4f2b'
            '6254e73446a91ea7945b9e4db1a1047eb2055d93aee315006857711ab21cba140da3badcf5834d2628e4799494a069647d11aa378a9bac67691df8d8b3adc12f'
            '926f7c787aea8c1027f331fe2e9417ba8e4f15a79f51610baafeed5d0de86d8f41da92f4460c29a5ce251e7cc110e26c2c344931af91949dc529595cc18c0f0e'
            '0d90ae4c0b9600f50ffd3e2c1a03b49d2fbdb9a2d14c8211e86463787549ada156498f68989d851952fe34660daaacc11242f5ee9e9e318f3d2a3eba0971eb53'
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
