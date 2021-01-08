pkgname=octane-blender-prime
pkgver=2020.1.5_22.2
pkgrel=1
pkgdesc="The free tier OctaneRender intergrated Blender"
arch=('x86_64')
license=('proprietary')
depends=('octane-server-prime')
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/downloads/90/ea/4e/94/octane_blender_2020.1.5-22.2-xb.run)
noextract=('octane_blender_2020.1.5-22.2-xb.run')
md5sums=('5e98aaaebf83b4f12a27d9167312e28c')

prepare()
{
  chmod +x octane_blender_2020.1.5-22.2-xb.run
  ./octane_blender_2020.1.5-22.2-xb.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneBlender ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneBlender/blender ${pkgdir}/usr/bin/OctaneBlender
}
