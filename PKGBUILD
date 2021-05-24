# Maintainer: wereii <me+aur at wereii.cz>
# Contributor: FD <fxd@seznam.cz>

pkgname=nomachine-enterprise-client
pkgver=7.6.2
_x64_rel=4
_i686_rel=1
pkgrel=1
pkgdesc="Remote desktop application"
groups=('network')
url="http://www.nomachine.com"
license=('custom:"NoMachine EULA"')
arch=('x86_64' 'i686')
options=('!strip')
conflicts=(nomachine nxmanager nxwebplayer nxserver nxnode nxclient)
install=nm-ent-client.install
backup=(etc/NX/player/localhost/{player,client}.cfg)

source=(player.cfg client.cfg nomachine-client)
sha256sums=(SKIP SKIP SKIP)

source_x86_64=("http://download.nomachine.com/download/${pkgver%*.*}/Linux/${pkgname}_${pkgver}_${_x64_rel}_x86_64.tar.gz")
source_i686=("http://download.nomachine.com/download/${pkgver%*.*}/Linux/${pkgname}_${pkgver}_${_i686_rel}_i686.tar.gz")

sha256sums_x86_64=('399f1ab3ddcd28519ded95d46f64a222743224cb6aa5cb8af637e2260c3093e0')
sha256sums_i686=('db9be126898bf9d2052db12596abf236d05d41698cc9249ae68a645b2d474a88')

package()
{
  install -Dm644 player.cfg client.cfg -t "${pkgdir}/etc/NX/player/localhost"

  install -Dm755 nomachine-client -t "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/opt"
  cd "${pkgdir}/opt"
  tar -xzf "${srcdir}/NX/etc/NX/player/packages/nxclient.tar.gz"
  tar -xzf "${srcdir}/NX/etc/NX/player/packages/nxplayer.tar.gz"

}
