pkgname=octane-blender-prime
pkgver=2020.1_21.8
pkgrel=1
pkgdesc="The free tier OctaneRender intergrated Blender"
arch=('x86_64')
license=('proprietary')
depends=('octane-server-prime')
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/downloads/c7/d6/77/85/octane_blender_2020.1-21.8-stable.run)
noextract=('octane_blender_2020.1-21.8-stable.run')
md5sums=('920af44e399161c0acf4360051e57c8a')

prepare()
{
  chmod +x octane_blender_2020.1-21.8-stable.run
  ./octane_blender_2020.1-21.8-stable.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneBlender ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneBlender/blender ${pkgdir}/usr/bin/OctaneBlender
}
