# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-fr-bin
_pkgname=betterbird
pkgver=115.6.0
_build=bb21
pkgrel=1
pkgdesc="FRENCH // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
depends=('dbus-glib')
provides=("betterbird=${pkgver}")
conflicts=('betterbird')
source=(
#	"https://www.betterbird.eu/downloads/get.php?os=linux&lang=de&version=release"
#    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}-replacement.fr.linux-x86_64.tar.bz2"
#    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}-build2.fr.linux-x86_64.tar.bz2"
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver//_/-}-${_build}.fr.linux-x86_64.tar.bz2"
    "betterbird.desktop"
)

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/${_pkgname}"
    install -m644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    ln -s /opt/$_pkgname/betterbird "$pkgdir"/usr/bin/$_pkgname

    echo     "

	  >>>>>    N'oubliez pas de voter pour ce package. MERCI
	  >>>>>    https://aur.archlinux.org/packages/betterbird-fr-bin

	  "

    #icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
            "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
}
sha256sums=('197d8772a495bfe0247c1d1d23ee31344ea74e831e37f0f55677208756303ddf'
            'b664d5453512ba1c8a58699d106fb1248991dbae0ee44464484be0886278945b')

