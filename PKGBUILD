_filename=octane_blender_2024.1.2-29.20.0-stable
pkgname=octane-blender-prime
pkgver=2024.1.2_29.20.0
pkgrel=1
pkgdesc="The free tier OctaneRender intergrated Blender"
arch=('x86_64')
license=('proprietary')
depends=('octane-server-prime>=2024.1.2_29.20.0')
optdepends=()
makedepends=()
url="https://home.otoy.com/render/octane-render/demo/"
source=(https://render.otoy.com/plugindownloads/86/50/70/77/octane_blender_2024.1.2-29.20.0-stable.run)
noextract=('octane_blender_2024.1.2-29.20.0-stable.run')
sha256sums=('2bfbd57c99697be0557c3f1e32c12bb03242467125f8e24b9b4b5c4d0932db66')

prepare()
{
  chmod +x ${_filename}.run
  ./${_filename}.run -e
}

package()
{
  mkdir -p ${pkgdir}/usr/local ${pkgdir}/usr/bin
  cp -rf ./OctaneForBlender/usr/local/OctaneBlender ${pkgdir}/usr/local/
  ln -s /usr/local/OctaneBlender/blender ${pkgdir}/usr/bin/OctaneBlender
}
