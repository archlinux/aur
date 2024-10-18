pkgname=octane-server-prime
pkgver=2024.1_29.14
pkgrel=1
pkgdesc="The free tier OctaneRender server by OTOY"
arch=('x86_64')
license=('proprietary')
depends=()
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/plugindownloads/a2/e1/48/0c/octane_server_prime_2024.1-29.14-stable.run)
noextract=('octane_server_prime_2024.1-29.14-stable.run')
sha256sums=('5ec9ce03edc0d5ddbe827051e63cb099bf41981994939c2753266ce0e728fc1e')

prepare()
{
  chmod +x octane_server_prime_2024.1-29.14-stable.run
  ./octane_server_prime_2024.1-29.14-stable.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneServer ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneServer/OctaneServer ${pkgdir}/usr/bin/OctaneServer
}
