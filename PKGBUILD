# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-vstplugin
pkgver=0.5.1
pkgrel=2
pkgdesc="The IEM vstplugin plugin for SuperCollider"
arch=("x86_64")
url="https://git.iem.at/pd/vstplugin"
license=('GPL')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
#This is the subfolder on IEM's gitlab containing the particular version. Each release is in a new folder.
_version_folder="4d85c8a57c2ea7e247b019f351797a66"
source=("pkgname-$pkgver-$pkgrel.zip::${url}/uploads/${_version_folder}/VSTPlugin_v${pkgver}_Linux.zip")
md5sums=('9fdd979e461335820f446f168da19cba')

package() {
	DESTINATION_="usr/share/SuperCollider/Extensions/"
	install -dm755 "${pkgdir}/$DESTINATION_/VSTPlugin"
	cp -av ${srcdir}/VSTPlugin "${pkgdir}/$DESTINATION_"
}
