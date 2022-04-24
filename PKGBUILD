# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-vstplugin
pkgver=0.5.4
pkgrel=1
pkgdesc="The IEM vstplugin plugin for SuperCollider"
arch=("x86_64")
url="https://git.iem.at/pd/vstplugin"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
#This is the subfolder on IEM's gitlab containing the particular version. Each release is in a new folder.
_version_folder="517820977bf2866943fae4f8f8c60d0e"
source=("$pkgname-$pkgver-$pkgrel.zip::${url}/uploads/${_version_folder}/VSTPlugin_v${pkgver}_Linux.zip")
md5sums=('095eb04b4eaf76e842bd011fc1aa7132')

package() {
	DESTINATION_="usr/share/SuperCollider/Extensions/"
	install -dm755 "${pkgdir}/$DESTINATION_/VSTPlugin"
	cp -av ${srcdir}/VSTPlugin "${pkgdir}/$DESTINATION_"
}
