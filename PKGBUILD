# Maintainer: Posi<posi1981@gmail.com>
pkgname=betterbird-nl-bin
_pkgname=betterbird
pkgver=128.12.0esr
_build=bb30
pkgrel=1
pkgdesc="DUTCH // Betterbird is a fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will."
arch=('x86_64')
url="https://www.betterbird.eu/index.html"
license=('MPL2')
depends=('dbus-glib')
provides=("betterbird=${pkgver}")
conflicts=('betterbird')
source=(
    "https://www.betterbird.eu/downloads/LinuxArchive/${_pkgname}-${pkgver}-${_build}.nl.linux-x86_64.tar.bz2"
    "eu.betterbird.Betterbird"
)

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    cp -r "${srcdir}/${_pkgname}/" "${pkgdir}/opt/${_pkgname}"
    install -m644 "${srcdir}/eu.${_pkgname}.Betterbird.desktop" "${pkgdir}/usr/share/applications/eu.${_pkgname}.Betterbird.desktop"
    ln -s /opt/$_pkgname/betterbird "$pkgdir"/usr/bin/$_pkgname

    echo     "

	  >>>>>    Vergeet niet te stemmen op dit pakket. BEDANKT
	  >>>>>    https://aur.archlinux.org/packages/betterbird-nl-bin

	  "
    #icons
    for i in 16 22 24 32 48 64 128 256; do
        install -d "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/
        ln -s /opt/$_pkgname/chrome/icons/default/default$i.png \
            "$pkgdir"/usr/share/icons/hicolor/${i}x${i}/apps/$_pkgname.png
    done
}
sha256sums=('3f8983b7858f58a5348e6f1fdb155724e90fe0b9a8127fb8ac8e1cb243a4f89e'
            '60045ec0138ad4c01546df596b97016e467bec6d69c7e4e4c7bdb85e91a31bc2')

