_pkgname=ya4r
pkgname="ya4r"
pkgver=0.2.1
pkgrel=1
pkgdesc="Yet Another 4Chan Reader - Built using the Electron framework - Beta channel."
arch=('x86_64' 'i686')
license=('GPL3')
url="https://github.com/0v3rl0w/${_pkgname}"
depends=('alsa-lib' 'gconf' 'gtk2' 'libgnome-keyring' 'libnotify' 'libxtst' 'nodejs' 'nss' 'python2' 'sudo')
optdepends=('gvfs: file deletion support')
makedepends=('git' 'npm')

_archive="${_pkgname}-${pkgver}"
source=(
	"${_archive}.tar.gz::$url/archive/${pkgver}.tar.gz"
)

sha256sums=('a598590979e00a403f67fdcbfc53065b5f82b9fc99e09f178310ae6694ba64f4')

prepare() {
	if [ -f /usr/share/applications/ya4r.desktop ]; then
		sudo rm -rf "/usr/share/applications/ya4r.desktop"
		sudo rm -rf "/usr/share/licenses/${pkgname}/LICENSE"
		sudo rm -rf "/opt/Ya4r-${pkgver}"
	fi
}

package() {
   
   sudo install -D -m644 "${srcdir}/Ya4r-${pkgver}/ya4r.desktop" "/usr/share/applications/ya4r.desktop"

   sudo install -D -m644 "${srcdir}/Ya4r-${pkgver}/LICENSE" "/usr/share/licenses/${pkgname}/LICENSE"

   sudo mv "${srcdir}/Ya4r-${pkgver}" "/opt"
}

