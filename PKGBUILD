# Maintainer: Ben Fox-Moore <ben.foxmoore@gmail.com>
pkgname=blockify-legacy
gitname=blockify
pkgver=1.9.0
pkgrel=1
pkgdesc="Mutes Spotify advertisements. Legacy version to support spotify-stable/spotify-legacy"
arch=("any")
url="https://github.com/mikar/${gitname}/tree/legacy"
license=("MIT")
conflicts=("blockify-git", "blockify")
depends=("spotify-legacy"
         "alsa-utils"
         "pygtk"
	 "gstreamer0.10-python"
	 "python2-wnck"
         "python2-dbus"
	)
makedepends=("python2-setuptools")
optdepends=("pulseaudio: mute spotify sink instead of system sound"
            "python2-docopt: command-line interface")
source=("https://github.com/mikar/${gitname}/archive/v${pkgver}.tar.gz")

package() {
    cd "$srcdir"/${gitname}-${pkgver}

    python2 setup.py install --root="${pkgdir}"
}
sha256sums=('48ad32beaa388550ca27d5d60c5e1f4ceb2351a7ea1cb7aef11750ab7d7666d0')
