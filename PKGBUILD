pkgname=octane-server-prime
pkgver=2020.1_21.8
pkgrel=1
pkgdesc="The free tier OctaneRender server by OTOY"
arch=('x86_64')
license=('proprietary')
depends=()
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/downloads/46/d1/da/77/octane_server_prime_2020.1-21.8-stable.run)
noextract=('octane_server_prime_2020.1-21.8-stable.run')
md5sums=('7801a04eeb6fa4159e487024605c63f4')

prepare()
{
  chmod +x octane_server_prime_2020.1-21.8-stable.run
  ./octane_server_prime_2020.1-21.8-stable.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneServer ${pkgdir}/usr/local/
  ln -s ${pkgdir}/usr/local/OctaneServer/OctaneServer ${pkgdir}/usr/bin/OctaneServer
}
