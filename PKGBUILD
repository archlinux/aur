# Maintainer: Jonathan la Cour <jon@lacour.me>
pkgname=chef-runner
pkgver=0.9.0
pkgrel=1
pkgdesc="The fastest way to run Chef cookbooks"
arch=('i686' 'x86_64' 'arm')
url="https://github.com/mlafeldt/chef-runner"
license=('Apache')
groups=()
depends=('openssh' 'rsync')
optdepends=('vagrant')
provides=()
conflicts=()
replaces=()
source=()
sha256sums=()

case "$CARCH" in
	arm*) _pkgarch="arm"
		sha256sums+=('5044b067a1f49e9147d9c19c3508c462dedf459be2b4eb5da236f120b31e612d')
		;;
	i686) _pkgarch="386"
		sha256sums+=('52a2206c5b149e5c54f4657a099c413939a062d4bc0223737ec032fc3d45ffba')
		;;
	x86_64) _pkgarch="amd64"
		sha256sums+=('8eb53b502aebf20c7aedb9ae7a6e51d9bbab2f639ea4cdaf1c98410a3df06ddd')
		;;
esac

source+=("https://github.com/mlafeldt/chef-runner/releases/download/v${pkgver}/${pkgname}_${pkgver}_linux_${_pkgarch}.zip")

package() {
  cd "${pkgname}_${pkgver}_linux_${_pkgarch}"
  install -D -m 755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
}
