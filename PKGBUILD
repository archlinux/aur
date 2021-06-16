# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-vstplugin
pkgver=0.5
pkgrel=1
pkgdesc="The IEM vstplugin plugin for SuperCollider"
arch=("x86_64")
url="https://git.iem.at/pd/vstplugin"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
#This is the subfolder on IEM's gitlab containing the particular version. Each release is in a new folder.
_version_folder="9e6babb9a946645afa3888f687732e04"
_version_suffix=-test4
source=("pkgname-$pkgver-$pkgrel.zip::${url}/uploads/${_version_folder}/VSTPlugin_v${pkgver}${_version_suffix}_Linux.zip")
md5sums=('0f702721cd20ebb13fac1924c19cdfeb')

package() {
	DESTINATION_="usr/share/SuperCollider/Extensions/"
	install -dm755 "${pkgdir}/$DESTINATION_/VSTPlugin"
	cp -av ${srcdir}/VSTPlugin "${pkgdir}/$DESTINATION_"
}
