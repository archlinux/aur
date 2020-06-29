pkgname=octane-blender-prime
pkgver=2020.1.3_21.9
pkgrel=1
pkgdesc="The free tier OctaneRender intergrated Blender"
arch=('x86_64')
license=('proprietary')
depends=('octane-server-prime')
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/downloads/f3/90/5a/70/octane_blender_2020.1.3-21.9-stable.run)
noextract=('octane_blender_2020.1.3-21.9-stable.run')
md5sums=('4be6f23dac3ca2417f1681eee4e297af')

prepare()
{
  chmod +x octane_blender_2020.1.3-21.9-stable.run
  ./octane_blender_2020.1.3-21.9-stable.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneBlender ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneBlender/blender ${pkgdir}/usr/bin/OctaneBlender
}
