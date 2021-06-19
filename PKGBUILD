# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-vstplugin
pkgver=0.5.0
pkgrel=2
pkgdesc="The IEM vstplugin plugin for SuperCollider"
arch=("x86_64")
url="https://git.iem.at/pd/vstplugin"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
#This is the subfolder on IEM's gitlab containing the particular version. Each release is in a new folder.
_version_folder="d68f9e435590ae7f2d9e83aab8d08038"
source=("pkgname-$pkgver-$pkgrel.zip::${url}/uploads/${_version_folder}/VSTPlugin_v${pkgver}_Linux.zip")
md5sums=('dfa36b1a9a00af124fc61b08537589b3')

package() {
	DESTINATION_="usr/share/SuperCollider/Extensions/"
	install -dm755 "${pkgdir}/$DESTINATION_/VSTPlugin"
	cp -av ${srcdir}/VSTPlugin "${pkgdir}/$DESTINATION_"
}
