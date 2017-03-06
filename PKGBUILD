# Maintainer: Andrew Dunai <andrew@dun.ai>
pkgname=voxelshop
_pkgname_upper=VoxelShop
pkgver=1.7.01
pkgrel=1
pkgdesc='VoxelShop is an extremely intuitive and powerful cross-platform software to modify and create voxel objects was designed from the ground up in close collaboration with artists.'
url=http://blackflux.com/node/11
license=('Apache')
groups=()
depends=('java-runtime-common')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
  'voxelshop'
  'VoxelShop.zip::http://blackflux.com/software/vs/download/?file=VoxelShop.zip'
)
noextract=()
sha256sums=('69ff1076bf585855c81862b06bf50bd67621ac435d0c0f4a2ac3d19aa31317aa'
            '86c1fd50ef32b17be92df37d6a5c2206e456d99bc7abe4da80a44f49d2a377d3')
arch=('i686' 'x86_64')

package() {
  mkdir -p ${pkgdir}/opt/
  chmod 755 ${srcdir}/${_pkgname_upper}/*.sh
  cp -r ${srcdir}/${_pkgname_upper} ${pkgdir}/opt/${pkgname}
  chown -R $USER:users ${pkgdir}/opt/${pkgname}
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  ln -s ${pkgname} ${pkgdir}/usr/bin/${_pkgname_upper}
}
