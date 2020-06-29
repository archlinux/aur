pkgname=octane-server-prime
pkgver=2020.1.3_21.9
pkgrel=1
pkgdesc="The free tier OctaneRender server by OTOY"
arch=('x86_64')
license=('proprietary')
depends=()
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/downloads/e7/f8/57/1b/octane_server_prime_2020.1.3-21.9-stable.run)
noextract=('octane_server_prime_2020.1.3-21.9-stable.run')
md5sums=('22c63152c414dff4b412249db6bd867a')

prepare()
{
  chmod +x octane_server_prime_2020.1.3-21.9-stable.run
  ./octane_server_prime_2020.1.3-21.9-stable.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneServer ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneServer/OctaneServer ${pkgdir}/usr/bin/OctaneServer
}
