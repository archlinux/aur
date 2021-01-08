pkgname=octane-server-prime
pkgver=2020.1.3_21.11
pkgrel=1
pkgdesc="The free tier OctaneRender server by OTOY"
arch=('x86_64')
license=('proprietary')
depends=()
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/downloads/34/be/2d/d8/octane_server_prime_2020.1.5-22.2-xb.run)
noextract=('octane_server_prime_2020.1.5-22.2-xb.run')
md5sums=('1d9ea74ffbb1eb961617132cb1cf4a5b')

prepare()
{
  chmod +x octane_server_prime_2020.1.5-22.2-xb.run
  ./octane_server_prime_2020.1.5-22.2-xb.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneServer ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneServer/OctaneServer ${pkgdir}/usr/bin/OctaneServer
}
