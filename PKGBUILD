# Maintainer: Rad.4ngel <radangelzero@gmail.com>
_pluginname=audio-wave
_gitname=obs-${_pluginname}
pkgname=obs-${_pluginname}-bin
pkgver=1.2.1
pkgrel=2
pkgdesc="Simple, lightweight audio wave visualizer source for OBS Studio"
arch=('x86_64')
url="https://github.com/mmlTools/${_pluginname}"
license=('GPL2')
groups=('obs-plugins')
depends=('obs-studio>=32.0.2')
provides=("obs-${_pluginname}")
conflicts=("${_gitname}" "${_gitname}-git" "obs-plugin-${_pluginname}-git")
source=("${url}/releases/download/${pkgver}/${_pluginname}-1.2.0-${arch}-linux-gnu.deb")
b2sums=('a472da521389e1bb560d53de642d1ffcdc7fc2dda4c49699d143307518815ce2745489885eff734d8a4ed24aa80dea573bdd0aed2144a38923ee2623cae6be6b')
sha512sums=('107f319fe0789cc4aa8c89a237fe927872767e7e43a89d04082954642ea38a70b7aa0a3e48d149d67a422ff9bcb8e91354961d6da869388341a6b80eb31037b0')

package() {
    bsdtar -xvf data.tar.gz -C "$srcdir/"

    cd ${srcdir}/

    install -d ${pkgdir}/usr/lib/obs-plugins/
	install -d ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/locale/

	install -Dm755 ./usr/lib/x86_64-linux-gnu/obs-plugins/${_pluginname}.so ${pkgdir}/usr/lib/obs-plugins/
	install -Dm755 ./usr/share/obs/obs-plugins/${_pluginname}/locale/* ${pkgdir}/usr/share/obs/obs-plugins/${_pluginname}/locale/
}
