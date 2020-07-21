pkgname=octane-blender-prime
pkgver=2020.1.3_21.11
pkgrel=1
pkgdesc="The free tier OctaneRender intergrated Blender"
arch=('x86_64')
license=('proprietary')
depends=('octane-server-prime')
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/downloads/a9/b7/52/7e/octane_blender_2020.1.3-21.11-stable.run)
noextract=('octane_blender_2020.1.3-21.11-stable.run')
md5sums=('efc4ddd09c0800eb8b472df4dc32b60a')

prepare()
{
  chmod +x octane_blender_2020.1.3-21.11-stable.run
  ./octane_blender_2020.1.3-21.11-stable.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneBlender ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneBlender/blender ${pkgdir}/usr/bin/OctaneBlender
}
