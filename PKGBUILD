# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-vstplugin
pkgver=0.5.2
pkgrel=2
pkgdesc="The IEM vstplugin plugin for SuperCollider"
arch=("x86_64")
url="https://git.iem.at/pd/vstplugin"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
#This is the subfolder on IEM's gitlab containing the particular version. Each release is in a new folder.
_version_folder="9cb0c5c78d4dac101bc9070146a8882e"
source=("$pkgname-$pkgver-$pkgrel.zip::${url}/uploads/${_version_folder}/VSTPlugin_v${pkgver}_Linux.zip")
md5sums=('d12ffb94488f22969e9bd9870d22085e')

package() {
	DESTINATION_="usr/share/SuperCollider/Extensions/"
	install -dm755 "${pkgdir}/$DESTINATION_/VSTPlugin"
	cp -av ${srcdir}/VSTPlugin "${pkgdir}/$DESTINATION_"
}
