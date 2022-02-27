# Maintainer: Que Quotion <quequotion@mailinator.com>

pkgname=throttlectl
pkgver=12
pkgrel=2
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
sha512sums=('e4473785ffe7621b365581e90d81b7e89d6c44ec3a4af78cbf199d17b3573aa2ce7fcba90e67f2b89836d75d23cbd66859fa41bf55d9d49bc04f8e09f13532ce'
            '6254e73446a91ea7945b9e4db1a1047eb2055d93aee315006857711ab21cba140da3badcf5834d2628e4799494a069647d11aa378a9bac67691df8d8b3adc12f'
            '7519f1d82b5c6bb64a14a54e12501a78e0c3bfdd928821a52cb9131004c5e17c0621a4bca30e8859da1bd494e48de79ab9713cc04ea555527651ebd59e14b89f'
            'f792398adf61a20f0ec371c954b8d0711332fed41d2966145b2f73f8214fd40110b0ca63d02da2eb67e87382ea5baedec819ec23b96517ed8309d9a9fbabbb88'
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
