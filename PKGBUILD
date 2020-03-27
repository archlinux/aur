# Maintainer: Que Quotion <quequotion@mailinator.com>

pkgname=throttlectl
pkgver=1
pkgrel=2
pkgdesc="Command-line user discretion power managment utility"
arch=('any')
url="https://bbs.archlinux.org/viewtopic.php?id=180762"
license=('GPL')
depends=('bash')
optdepends=('x86_energy_perf_policy' 'hdparm' 'nvidia-utils' 'iw' 'ethtool')
backup=(etc/throttle.d/{powersave,performance})
source=('throttlectl'
        'throttle-cut.service'
        'powersave'
        'performance')
sha512sums=('48fac136a0ff11bec6c7c5fc840f81dc2f04dea5fe1132b4af735940e1360cc320f6a59cac573a356bf7ab25166bbc2da6fb9faf981644196d277824a2219337'
            '6254e73446a91ea7945b9e4db1a1047eb2055d93aee315006857711ab21cba140da3badcf5834d2628e4799494a069647d11aa378a9bac67691df8d8b3adc12f'
            '3d487961bf86254817fd099b888d6245bbf1e57622166dc8df378d639bfb1c0fc105646038be6093183be102294394b88cde382fe961f7606b68619af4a00595'
            'd11ed5f4344f07507497e816ccd7612ffc6df70636ca5f4817a9ce6e3b190b3a17fb02c44c4bf648359f640e4c63cc0b0134968ff4d3d989ad05fa4c095b03d3')

package() {
  install -Dm755 {${srcdir},${pkgdir}/usr/bin}/throttlectl
  install -Dm644 {${srcdir},${pkgdir}/etc/throttle.d}/powersave
  install -Dm644 {${srcdir},${pkgdir}/etc/throttle.d}/performance

  install -Dm644 {${srcdir},${pkgdir}/etc/systemd/system}/throttle-cut.service
  #install -Dm644 {${srcdir},${pkgdir}/etc/udev/rules.d}/throttle-runtime-pm.rules

}
