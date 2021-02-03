# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=rankmirrors-systemd
pkgver=1
pkgrel=6

license=('MIT')
pkgdesc='Rank Pacman mirrors based on the speed related to the host network'
depends=('pacman-contrib' 'curl' 'sed' 'systemd')
arch=('i686' 'x86_64')
url='https://github.com/EgidioCaprino/rankmirrors-systemd'
source=('rankmirrors.service' 'rankmirrors.timer' 'rankmirrors')
sha512sums=(
  '8d9439f37720f32eb34df36e9e3b21742be318fd31e86d8a29df4caaa01d5c1db73b8dfd5b59396f6fbedd67725cf70d890e2674bad3229ad85badf50c257d04'
  '7caf7d3e9c93f3aee0ffdb55460215f1d52c1677e0e26d7ebbbf9345417787607080804f39e23f5632bccb7312fa70e59bf9e635b20bd3260aae7713823769ed'
  '2a4f5b605bd30e6973a298057064f9d5b4103c60d651222bfd6a480914bf3756926fd022e4c8b5de5593259524eb9f30fea365694d713bf718c66720c84a0d3e'
)

package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/opt"

  install -m 444 "${srcdir}/rankmirrors.service" "${pkgdir}/usr/lib/systemd/system/"
  install -m 444 "${srcdir}/rankmirrors.timer" "${pkgdir}/usr/lib/systemd/system/"
  install -m 544 "${srcdir}/rankmirrors" "${pkgdir}/opt/"
}
