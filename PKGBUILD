pkgname=octane-blender-prime
pkgver=2024.1_29.14
pkgrel=1
pkgdesc="The free tier OctaneRender intergrated Blender"
arch=('x86_64')
license=('proprietary')
depends=('octane-server-prime')
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/plugindownloads/d5/f7/c6/f1/octane_blender_2024.1-29.14.1-stable.run)
noextract=('octane_blender_2024.1-29.14.1-stable.run')
sha256sums=('8abb75183eabd9dfba9b3784e4dca2aa75ed3a579f70b5b28e68b9ea252efb21')

prepare()
{
  chmod +x octane_blender_2024.1-29.14.1-stable.run
  ./octane_blender_2024.1-29.14.1-stable.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneBlender ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneBlender/blender ${pkgdir}/usr/bin/OctaneBlender
}
