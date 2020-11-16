# Maintainer: Egidio Caprino <egidio.caprino@gmail.com>

pkgname=rankmirrors-systemd
pkgver=1
pkgrel=3

license=('MIT')
pkgdesc='Rank Pacman mirrors based on the speed related to the host network'
depends=('pacman-contrib' 'curl' 'sed' 'systemd')
arch=('i686' 'x86_64')
url='https://github.com/EgidioCaprino/rankmirrors-systemd'
source=('rankmirrors.service' 'rankmirrors.timer' 'rankmirrors')
sha512sums=(
  '8d9439f37720f32eb34df36e9e3b21742be318fd31e86d8a29df4caaa01d5c1db73b8dfd5b59396f6fbedd67725cf70d890e2674bad3229ad85badf50c257d04'
  '7caf7d3e9c93f3aee0ffdb55460215f1d52c1677e0e26d7ebbbf9345417787607080804f39e23f5632bccb7312fa70e59bf9e635b20bd3260aae7713823769ed'
  'db989598ab5c8be6070dea49f48da63fc168860e860c3b03ca858d3aaefe0dd3367467f532c2aaf6a43a31f06015aabb40e15206f40552c758e0cd1be0028a24'
)

package() {
  mkdir -p "${pkgdir}/usr/lib/systemd/system"
  mkdir -p "${pkgdir}/opt"

  install -m 444 "${srcdir}/rankmirrors.service" "${pkgdir}/usr/lib/systemd/system/"
  install -m 444 "${srcdir}/rankmirrors.timer" "${pkgdir}/usr/lib/systemd/system/"
  install -m 544 "${srcdir}/rankmirrors" "${pkgdir}/opt/"
}
