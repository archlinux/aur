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
source=(https://render.otoy.com/downloads/46/6e/7d/ad/octane_server_prime_2020.1.3-21.11-stable.run)
noextract=('octane_server_prime_2020.1.3-21.11-stable.run')
md5sums=('07fcfb01ccd5e1f3bc0eff8883b0440e')

prepare()
{
  chmod +x octane_server_prime_2020.1.3-21.11-stable.run
  ./octane_server_prime_2020.1.3-21.11-stable.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneServer ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneServer/OctaneServer ${pkgdir}/usr/bin/OctaneServer
}
