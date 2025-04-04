_filename=octane_server_prime_2024.1.2-29.20.0-stable
pkgname=octane-server-prime
pkgver=2024.1.2_29.20.0
pkgrel=1
pkgdesc="The free tier OctaneRender server by OTOY"
arch=('x86_64')
license=('proprietary')
depends=()
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/plugindownloads/57/47/a8/72/octane_server_prime_2024.1.2-29.20.0-stable.run)
noextract=('octane_server_prime_2024.1.2-29.20.0-stable.run')
sha256sums=('069c8a7a5a1af294a35b9bf52716372b04398ced9776d76a1a51df3dc4b56cdb')

prepare()
{
  chmod +x ${_filename}.run
  ./${_filename}.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneServer ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneServer/OctaneServer ${pkgdir}/usr/bin/OctaneServer
}
