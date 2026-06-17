# Maintainer: Sinyria <sinyria ad speed dod at>
# replace ad and dod accordingly (antispam)
# Creator/Contributor: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-vstplugin
pkgver=0.6.2
pkgrel=1
pkgdesc="The IEM vstplugin plugin for SuperCollider"
arch=("x86_64")
url="https://git.iem.at/pd/vstplugin"
license=('BSD-3-Clause')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
conflicts=('supercollider-vstplugin-git')
#This is the subfolder on IEM's gitlab containing the particular version. Each release is in a new folder.
_version_folder="7dcb287f5cc882fd3aa6f157cdc7bb5d"
source=("$pkgname-$pkgver-$pkgrel.zip::https://git.iem.at/-/project/485/uploads/${_version_folder}/vstplugin_v${pkgver}_Linux.zip")
sha256sums=('f7139df5ac74be5bd71fe32b992a8706470897ca026bec3b06c920ea170f227f')

package() {
	DESTINATION_="usr/share/SuperCollider/Extensions/"
	install -dm755 "${pkgdir}/$DESTINATION_/VSTPlugin"
	cp -av ${srcdir}/sc/VSTPlugin "${pkgdir}/$DESTINATION_"
}
